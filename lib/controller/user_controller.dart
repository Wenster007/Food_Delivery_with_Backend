import 'dart:io';

import 'package:food_delivery_with_backend/data/repository/user_repo.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';

class UserController extends GetxController {
  final UserRepo userRepo;

  UserController({required this.userRepo});

  bool isLoading = false;


  final _imagePicker = ImagePicker();
  File? image;
  String? imageUrl;
  bool isProfilePicUploaded = false;
  bool profilePicLoading = false;

  void createUser(String email, String pass, String name, String phone) async {
    isLoading = true;
    update();
    await userRepo.createAccountUsingEmailPass(email, pass, name, phone);
    isLoading = false;
    update();
  }

  void loginUser(String email, String pass) async {
    isLoading = true;
    update();
    await userRepo.loginUsingEmailPass(email, pass);
    isLoading = false;
    update();
  }

  void isUserLogin() {
    userRepo.isLogin();
  }

  void logoutUser() {
    userRepo.logout();
  }

  String get userEmail {
    return userRepo.getEmailFromSharedPreferences();
  }

  String get userName {
    return userRepo.getNameFromSharedPreferences();
  }

  String get userPhone {
    return userRepo.getPhoneFromSharedPreferences();
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      uploadImageToFirebase();
      update();
    }
  }

  Future<void> uploadImageToFirebase() async {
    if (image != null) {
      final storageReference =
          FirebaseStorage.instance.ref("Images").child('profilePictures/${userRepo.auth.currentUser!.uid}');
      final UploadTask uploadTask = storageReference.putFile(image!.absolute);
      await uploadTask.whenComplete(() async {
        imageUrl = await storageReference.getDownloadURL();

        // Save image URL to Firebase Realtime Database
        FirebaseDatabase.instance
            .ref("Users")
            .child(userRepo.auth.currentUser!.uid)
        .child("images")
            .set({'profileImageUrl': imageUrl});
        isProfilePicUploaded = true;
        print("image uploaded");
      });
    }


  }


  Future<void> isUserProfilePicUploaded() async {
    image = null;
    isProfilePicUploaded = false;
    profilePicLoading = true;

    update();

    DatabaseEvent databaseEvent =
        await FirebaseDatabase.instance.ref("Users").child(userRepo.auth.currentUser!.uid).once();

    Map<dynamic, dynamic> userMap =
    databaseEvent.snapshot.value as Map<dynamic, dynamic>;

    if (userMap["images"] != null){
      imageUrl = userMap["images"]["profileImageUrl"];
      profilePicLoading = false;
      isProfilePicUploaded = true;

      update();
    }
    else{
      isProfilePicUploaded = false;
    }

  }

}
