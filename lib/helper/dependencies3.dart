import 'package:get/get.dart';

import '../controller/order_controller.dart';
import '../data/repository/cart_repo.dart';
import '../data/repository/order_repo.dart';

void init() {
  Get.put(OrderRepo(Get.find<CartRepo>()));
  Get.put(OrderController(Get.find<OrderRepo>()));
}