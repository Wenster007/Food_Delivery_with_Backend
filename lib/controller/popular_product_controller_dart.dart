import 'package:food_delivery_with_backend/controller/cart_controller.dart';
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
  int _cartItem = 0;
  int get getCartItem => _cartItem + getQuantity;

  final CartController _cart = Get.find<CartController>();


  Future<void> getPopularProductList() async{

  Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products!);
      isLoaded = true;
      update();
    } else {
      print("Could not get Popular Products");
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

  void initProduct(Products product){
    _quantity = 1;
    _cartItem = 0;
  }

  void addItem(Products product) {
    _cart.addItem(product, _quantity);
    _quantity = 1;
    update();
    _cart.items.forEach((key, value) {
      print("${value.name} has quantity ${value.quantity}");
    });
  }

  int get getTotalCartItems{
    return _cart.getTotalCartItems;
  }
}