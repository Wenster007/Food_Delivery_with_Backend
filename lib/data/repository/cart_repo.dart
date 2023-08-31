import 'dart:convert';
import 'package:food_delivery_with_backend/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/cart_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartRepo {
  final SharedPreferences? sharedPreferences;

  CartRepo({this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];

  final database = FirebaseDatabase.instance;
  final currentUser = FirebaseAuth.instance;

  //this is used for adding the items to sharedPreferences cart-list
  void addToCartList(List<CartModel> listOfCartProducts) {
    cart = [];

    listOfCartProducts.forEach((element) {
      cart.add(jsonEncode(element));
    });

    sharedPreferences!.setStringList(AppConstants.CART_LIST, cart);
    addCartItemsToFirebase(cart);
  }

  //takes cartItems and save it to firebase database.
  void addCartItemsToFirebase(List<String> cartItems) {
    database
        .ref("Users")
        .child(currentUser.currentUser!.uid)
        .child("cart_items")
        .set(cartItems);
  }

  //this is used for getting the items from sharedPreferences cart-list.
  List<CartModel> getCartList() {
    List<String> carts = [];

    if (sharedPreferences!.containsKey(AppConstants.CART_LIST)) {
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
    cartHistory = [];
    cartHistory = sharedPreferences!.getStringList(AppConstants.CART_LIST)!;

    cart = [];
    sharedPreferences!.remove(AppConstants.CART_LIST);
    removeCartItemsFromFirebase();
  }

  //to remove cartItems from firebase when the order is placed
  void removeCartItemsFromFirebase() {
    database
        .ref("Users")
        .child(currentUser.currentUser!.uid)
        .child("cart_items")
        .remove();
  }

  //adds data of new logined user to shared preferences
  Future<void> addFirebaseDataToSharedPreferences() async {
    List<String> cartItemsFetchedFromFirebase = [];

    DatabaseEvent databaseEvent =
        await database.ref("Users").child(currentUser.currentUser!.uid).once();

    Map<dynamic, dynamic> userMap =
        databaseEvent.snapshot.value as Map<dynamic, dynamic>;

    if (userMap["cart_items"] != null){
      final cartItemsMapList = userMap["cart_items"];

      for (int i=0; i<cartItemsMapList.length; i++){
        cartItemsFetchedFromFirebase.add(cartItemsMapList[i]);
      }

      sharedPreferences!.setStringList(AppConstants.CART_LIST, cartItemsFetchedFromFirebase);

    } else {
      sharedPreferences!.remove(AppConstants.CART_LIST);
    }
  }



  //for getting data from the CartHistoryList
  List<CartModel> getCartHistoryList() {
    print("5 getting from carthistorylist from shared preferences");

    List<CartModel> cartListHistory = [];

    cartHistory.forEach((element) {
      cartListHistory.add(CartModel.fromJson(jsonDecode(element)));
    });

    return cartListHistory;
  }


}
