import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:food_delivery_with_backend/controller/cart_controller.dart';
import 'package:food_delivery_with_backend/pages/home/home_page.dart';
import 'package:food_delivery_with_backend/pages/login/login_page.dart';
import 'package:food_delivery_with_backend/utils/toast.dart';
import 'package:get/get.dart';

import '../../controller/order_controller.dart';


class UserRepo {
  final auth = FirebaseAuth.instance;
  final database = FirebaseDatabase.instance;

  void createAccountUsingEmailPass(
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

  void loginUsingEmailPass(String email, String pass) async {

    await auth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((value)async {
      await Get.find<CartController>().getCartItemsFromFirebase();
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
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => HomePage());
    }
  }

  void logout() {
    auth.signOut();
    Get.offAll(() => LoginPage());
  }
}
