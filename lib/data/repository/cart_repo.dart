import 'dart:convert';
import 'package:food_delivery_with_backend/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/cart_model.dart';

class CartRepo{
  final SharedPreferences? sharedPreferences;
  CartRepo({this.sharedPreferences});

  List<String> cart = [];

  void addToCartList(List<CartModel> listOfCartProducts) {
    cart=[];

    listOfCartProducts.forEach((element) {
      cart.add(jsonEncode(element));
    });

    sharedPreferences!.setStringList(AppConstants.CART_LIST, cart);
    print("Added to shared Preferences");
    print(sharedPreferences!.getStringList(AppConstants.CART_LIST));
    print("\n\n");
    getCartList();
  }


  List<CartModel> getCartList() {
    List<String> carts = [];

    if(sharedPreferences!.containsKey(AppConstants.CART_LIST)){
      carts = sharedPreferences!.getStringList(AppConstants.CART_LIST)!;
      print("inside cart list " + carts.toString());
    }

    List<CartModel> cartList = [];

    carts.forEach((element) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    });

    return cartList;
  }
}