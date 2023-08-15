import 'dart:convert';
import 'package:food_delivery_with_backend/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/cart_model.dart';

class CartRepo{
  final SharedPreferences? sharedPreferences;
  CartRepo({this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];


  //this is used for adding the items to sharedPreferences cart-list
  void addToCartList(List<CartModel> listOfCartProducts) {
    cart=[];

    listOfCartProducts.forEach((element) {
      cart.add(jsonEncode(element));
    });

    sharedPreferences!.setStringList(AppConstants.CART_LIST, cart);
  }


  //this is used for getting the items from sharedPreferences cart-list.
  List<CartModel> getCartList() {
    List<String> carts = [];

    if(sharedPreferences!.containsKey(AppConstants.CART_LIST)){
      carts = sharedPreferences!.getStringList(AppConstants.CART_LIST)!;
    }

    List<CartModel> cartList = [];

    carts.forEach((element) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    });

    return cartList;
  }


  //for adding items into order CartHistoryList
  void addToCartHistoryList() {
    for (int i=0; i<cart.length; i++){
      cartHistory.add(cart[i]);
    }

    sharedPreferences!.remove(AppConstants.CART_LIST);
    sharedPreferences!.setStringList(AppConstants.CART_HISTORY_LIST, cartHistory);
  }
}