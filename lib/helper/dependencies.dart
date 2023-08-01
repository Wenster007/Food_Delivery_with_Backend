import 'package:food_delivery_with_backend/controller/popular_controller_dart.dart';
import 'package:food_delivery_with_backend/data/api/api_client.dart';
import 'package:food_delivery_with_backend/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async{
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://www.dbestech.com"));
  Get.lazyPut(() => PopularProuductRepo(apiClient: Get.find<ApiClient>()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find<PopularProuductRepo>()));
}