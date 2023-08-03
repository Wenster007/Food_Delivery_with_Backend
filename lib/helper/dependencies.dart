import 'package:food_delivery_with_backend/controller/popular_product_controller_dart.dart';
import 'package:food_delivery_with_backend/data/api/api_client.dart';
import 'package:food_delivery_with_backend/data/repository/popular_product_repo.dart';
import 'package:food_delivery_with_backend/utils/app_constants.dart';
import 'package:get/get.dart';

import '../controller/recommended_food_controller.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void> init() async{
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find<ApiClient>()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find<ApiClient>()));

  //repository
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find<PopularProductRepo>()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find<RecommendedProductRepo>()));
}