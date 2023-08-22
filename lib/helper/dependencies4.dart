import 'package:get/get.dart';

import '../controller/user_controller.dart';
import '../data/repository/user_repo.dart';


void init() {
  Get.put(UserRepo());
  Get.put(UserController(userRepo: Get.find<UserRepo>()));
}