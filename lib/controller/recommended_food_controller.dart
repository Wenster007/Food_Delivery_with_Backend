import 'package:food_delivery_with_backend/models/product_model.dart';
import 'package:get/get.dart';
import 'package:food_delivery_with_backend/data/repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get getProductList => _recommendedProductList;

  bool isLoaded = false;


  Future<void> getRecommendedProductList() async{
    Response response = await recommendedProductRepo.getRecommendedProductList();

    if (response.statusCode == 200) {
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products!);
      isLoaded = true;
      update();
    } else {
      print("Could not get recommended products");
    }
  }

}

