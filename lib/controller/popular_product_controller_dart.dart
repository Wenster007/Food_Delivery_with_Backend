import 'package:food_delivery_with_backend/data/repository/popular_product_repo.dart';
import 'package:food_delivery_with_backend/models/product_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get getProductList => _popularProductList;

  bool isLoaded = false;


  Future<void> getPopularProductList() async{
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products!);
      isLoaded = true;
      update();
    } else {

    }
  }

}