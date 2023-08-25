import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:food_delivery_with_backend/data/repository/cart_repo.dart';

import '../../models/order_model.dart';
import '../../utils/app_constants.dart';

class OrderRepo {
  final CartRepo cartRepo;

  OrderRepo(this.cartRepo);

  List<Order> listOfOrders = [];
  List<String> listOfOrdersSharedPreferences = [];

  final database = FirebaseDatabase.instance;
  final currentUser = FirebaseAuth.instance;

  void addOrderToSharedPreferences() {
    print("6 add Order to shared Preferences");
    listOfOrders.add(Order(
        orderItems: cartRepo.getCartHistoryList(),
        time: DateTime.now().toString()));

    listOfOrdersSharedPreferences = [];
    listOfOrders.forEach((element) {
      listOfOrdersSharedPreferences.add(jsonEncode(element));
    });

    cartRepo.sharedPreferences!.setStringList(
        AppConstants.ORDER_HISTORY_LIST, listOfOrdersSharedPreferences);

    addOrdersToFirebase(listOfOrdersSharedPreferences);
  }


  //for adding orders data to firebase.
  void addOrdersToFirebase(List<String> orders) {
    database
        .ref("Users")
        .child(currentUser.currentUser!.uid)
        .child("order_history_list")
        .set(orders);
  }

  //for fetching Orders from firebase and saving in sharedPreferences
  Future<void> addFirebaseDataToSharedPreferences() async {
    List<String> ordersFetchedFromFirebase = [];

    DatabaseEvent databaseEvent =
    await database.ref("Users").child(currentUser.currentUser!.uid).once();

    Map<dynamic, dynamic> userMap =
    databaseEvent.snapshot.value as Map<dynamic, dynamic>;

    if (userMap["order_history_list"] != null){
      final cartItemsMapList = userMap["order_history_list"];

      for (int i=0; i<cartItemsMapList.length; i++){
        ordersFetchedFromFirebase.add(cartItemsMapList[i]);
      }

      cartRepo.sharedPreferences!.setStringList(AppConstants.ORDER_HISTORY_LIST, ordersFetchedFromFirebase);

    } else {
      cartRepo.sharedPreferences!.remove(AppConstants.ORDER_HISTORY_LIST);
    }
  }

  List<Order> getListOfOrders() {
    print("7 get order from shared preferences");
    listOfOrdersSharedPreferences = [];

    if (cartRepo.sharedPreferences!
        .containsKey(AppConstants.ORDER_HISTORY_LIST)) {
      listOfOrdersSharedPreferences = cartRepo.sharedPreferences!
          .getStringList(AppConstants.ORDER_HISTORY_LIST)!;
    }

    listOfOrders = [];


    listOfOrdersSharedPreferences.forEach((element) {
      listOfOrders.add(Order.fromJson(jsonDecode(element)));
    });

    return listOfOrders;
  }

}
