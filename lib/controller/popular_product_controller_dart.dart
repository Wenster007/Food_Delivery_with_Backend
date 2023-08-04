import 'package:food_delivery_with_backend/data/repository/popular_product_repo.dart';
import 'package:food_delivery_with_backend/models/product_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get getProductList => _popularProductList;

  bool isLoaded = false;
  int _quantity = 1;
  int get getQuantity => _quantity;


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

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      if (_quantity<20){
        _quantity++;
      } else{
        Get.snackbar("Item Count", "You Can't Add More");
      }
    } else {
      if(_quantity != 1) {
        _quantity--;
      } else {
        Get.snackbar("Item Count", "You have to order a minimum of 1 Item");
      }
    }
    update();
  }

  void initProduct(){
    _quantity = 1;
  }
}