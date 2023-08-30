import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:food_delivery_with_backend/controller/cart_controller.dart';
import 'package:food_delivery_with_backend/pages/home/home_page.dart';
import 'package:food_delivery_with_backend/pages/login/login_page.dart';
import 'package:food_delivery_with_backend/utils/app_constants.dart';
import 'package:food_delivery_with_backend/utils/toast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';


import '../../controller/order_controller.dart';

class UserRepo {
  final auth = FirebaseAuth.instance;
  final database = FirebaseDatabase.instance;
  final googleSignIn = GoogleSignIn();

  SharedPreferences sharedPreferences = Get.find();

  Future<void> createAccountUsingEmailPass(
      String email, String pass, String name, String phone) async {
    await auth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((value) {
      database.ref("Users").child(value.user!.uid).set({
        "name": name,
        "email": email,
        "phone": phone,
      });
      Get.back();
    }).onError((error, stackTrace) {
      toast().generateToast(error.toString());
    });
  }

  Future<void> loginUsingEmailPass(String email, String pass) async {
    await auth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((value) async {
      await Get.find<CartController>().getCartItemsFromFirebase();
      await Get.find<OrderController>().getOrdersFromFirebase();
      await getUserDetailsFromFirebase(value.user!.uid);
      Get.find<CartController>().getCartData();
      Get.find<OrderController>().getListOfOrders();
      Get.offAll(() => const HomePage());
    }).onError((error, stackTrace) {
      toast().generateToast(error.toString());
    });
  }

  void isLogin() {
    final user = auth.currentUser;

    if (user == null) {
      Get.offAll(() => const LoginPage());
    } else {
      Get.offAll(() => const HomePage());
    }
  }

  Future<void> getUserDetailsFromFirebase(String uid) async {
    DatabaseEvent databaseEvent = await database.ref("Users").child(uid).once();

    Map<dynamic, dynamic> userMap =
        databaseEvent.snapshot.value as Map<dynamic, dynamic>;

    if (userMap["email"] != null) {
      sharedPreferences.setString(AppConstants.USER_EMAIL, userMap["email"]);
    } else {
      sharedPreferences.remove(AppConstants.USER_EMAIL);
    }

    if (userMap["name"] != null) {
      sharedPreferences.setString(AppConstants.USER_NAME, userMap["name"]);
    } else {
      sharedPreferences.remove(AppConstants.USER_NAME);
    }

    if (userMap["phone"] != null) {
      sharedPreferences.setString(AppConstants.USER_PHONE, userMap["phone"]);
    } else {
      sharedPreferences.remove(AppConstants.USER_PHONE);
    }
  }

  String? getNameFromSharedPreferences() {
    if (sharedPreferences.containsKey(AppConstants.USER_NAME)){
      return sharedPreferences.getString(AppConstants.USER_NAME)!;
    }

    return null;
  }

  String? getEmailFromSharedPreferences() {
    if (sharedPreferences.containsKey(AppConstants.USER_EMAIL)){
      return sharedPreferences.getString(AppConstants.USER_EMAIL)!;
    }

    return null;
  }

  String? getPhoneFromSharedPreferences() {
    if (sharedPreferences.containsKey(AppConstants.USER_PHONE)){
      return sharedPreferences.getString(AppConstants.USER_PHONE)!;
    }

    return null;
  }

  void logout() {
    auth.signOut();
    Get.offAll(() => const LoginPage());
  }

  void storeImageInSharedPreferences(String imagePath) {
    sharedPreferences.setString(AppConstants.PROFILE_IMG_PATH, imagePath);
  }

  Future<void> forgotPassword(String email) async {
    await auth
        .sendPasswordResetEmail(email: email)
        .onError((error, stackTrace) => toast().generateToast(error.toString()))
        .whenComplete(() => toast().generatePositiveToast("Recovery Email was sent."));
  }

  Future<void> loginThroughGoogle() async {

    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuth = await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuth.accessToken,
        idToken: googleSignInAuth.idToken,
      );

      final userCredential = await auth.signInWithCredential(credential);

      await database.ref("Users").child(userCredential.user!.uid).set({
        "name": userCredential.user!.displayName,
        "email": userCredential.user!.email,
        "phone": userCredential.user!.phoneNumber,
      });


      await Get.find<CartController>().getCartItemsFromFirebase();
      await Get.find<OrderController>().getOrdersFromFirebase();
      await getUserDetailsFromFirebase(userCredential.user!.uid);
      Get.find<CartController>().getCartData();
      Get.find<OrderController>().getListOfOrders();
      Get.offAll(()=> const HomePage());

    }

    // try{
    //
    // }catch (error) {
    //   toast().generateToast(error.toString());
    //   print(error);
    // }
  }
}

