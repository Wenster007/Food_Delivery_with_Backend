import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery_with_backend/pages/home/home_page.dart';
import 'package:food_delivery_with_backend/utils/toast.dart';
import 'package:get/get.dart';

class UserRepo {
  final auth = FirebaseAuth.instance;

  void createAccountUsingEmailPass(String email, String pass) {
    auth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((value) => Get.back())
        .onError((error, stackTrace) {
      toast().generateToast(error.toString());
    });
  }

  void loginUsingEmailPass(String email, String pass) {
    auth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((value) => Get.offAll(() => const HomePage()))
        .onError((error, stackTrace) {
      toast().generateToast(error.toString());
    });
  }
}
