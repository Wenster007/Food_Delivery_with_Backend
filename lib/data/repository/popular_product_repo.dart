import 'package:food_delivery_with_backend/data/api/api_client.dart';
import 'package:get/get.dart';

class PopularProuductRepo extends GetxService{
  final ApiClient apiClient;

  PopularProuductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
    return await apiClient.getData("http://mvs.bslmeiyu.com/api/v1/products/popular");
  }
}