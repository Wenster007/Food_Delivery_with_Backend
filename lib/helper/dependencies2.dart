import 'package:food_delivery_with_backend/controller/order_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';
import '../data/repository/cart_repo.dart';
import '../data/repository/order_repo.dart';

void init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => CartRepo(sharedPreferences: sharedPreferences));
  Get.lazyPut(() => CartController(Get.find<CartRepo>()));

  Get.lazyPut(() => OrderRepo(Get.find<CartRepo>()));
  Get.lazyPut(() => OrderController(Get.find<OrderRepo>()));
}