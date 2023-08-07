import 'package:food_delivery_with_backend/models/product_model.dart';
import 'package:get/get.dart';
import 'package:food_delivery_with_backend/data/repository/recommended_product_repo.dart';

import 'cart_controller.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList = [];

  List<dynamic> get getProductList => _recommendedProductList;

  bool isLoaded = false;
  final CartController _cart = Get.find<CartController>();
  int _quantity = 1;
  int get getQuantity => _quantity;
  int _cartItem = 0;
  int get getCartItem => _cartItem + getQuantity;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();

    if (response.statusCode == 200) {
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products!);
      isLoaded = true;
      print("recommended loaded");
      update();
    } else {
      print("Could not get recommended products");
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      if (_quantity < 20) {
        _quantity++;
      } else {
        Get.snackbar("Item Count", "You Can't Add More");
      }
    } else {
      if (_quantity != 1) {
        _quantity--;
      } else {
        Get.snackbar("Item Count", "You have to order a minimum of 1 Item");
      }
    }
    update();
  }

  void initProduct(Products product) {
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

  int get getTotalCartItems {
    return _cart.getTotalCartItems;
  }
}
