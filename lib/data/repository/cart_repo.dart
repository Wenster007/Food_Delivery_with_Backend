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
    // sharedPreferences!.remove(AppConstants.CART_LIST);
    // sharedPreferences!.remove(AppConstants.CART_HISTORY_LIST);
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
    // if (sharedPreferences!.containsKey(AppConstants.CART_HISTORY_LIST)){
    //   cartHistory = sharedPreferences!.getStringList(AppConstants.CART_HISTORY_LIST)!;
    // }

    cartHistory = [];
    for (int i=0; i<cart.length; i++){
      cartHistory.add(cart[i]);
    }

    cart = [];
    sharedPreferences!.remove(AppConstants.CART_LIST);
    // sharedPreferences!.setStringList(AppConstants.CART_HISTORY_LIST, cartHistory);
  }


  //for getting data from the CartHistoryList
  List<CartModel> getCartHistoryList() {
    // if (sharedPreferences!.containsKey(AppConstants.CART_HISTORY_LIST)){
    //  cartHistory = [];
    //  cartHistory = sharedPreferences!.getStringList(AppConstants.CART_HISTORY_LIST)!;
    // }

    List<CartModel> cartListHistory = [];

    cartHistory.forEach((element) {
      cartListHistory.add(CartModel.fromJson(jsonDecode(element)));
    });

    return cartListHistory;
  }
}