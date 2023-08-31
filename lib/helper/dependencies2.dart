import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';
import '../data/repository/cart_repo.dart';

void init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => CartRepo(sharedPreferences: sharedPreferences));
  Get.lazyPut(() => CartController(Get.find<CartRepo>()));


}