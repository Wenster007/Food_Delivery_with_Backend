import 'dart:io';

import 'package:food_delivery_with_backend/data/repository/user_repo.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController{
  final UserRepo userRepo;

  UserController({required this.userRepo});

  bool isLoading = false;


  final _imagePicker = ImagePicker();
  File? image;
  String? _imageUrl;


  void createUser(String email, String pass, String name, String phone) async{
    isLoading = true;
    update();
    await userRepo.createAccountUsingEmailPass(email, pass, name, phone);
    isLoading = false;
    update();
  }

  void loginUser(String email, String pass) async{
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
      update();
      image = File(pickedFile.path);
    }
  }

  void getProfileImage() {
    String? imagePath ;
    userRepo.getImageFromSharedPreferences(imagePath);

    if(imagePath != null) {
      image = File(imagePath);
    }
  }



}