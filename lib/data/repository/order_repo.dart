import 'dart:convert';
import 'package:food_delivery_with_backend/data/repository/cart_repo.dart';

import '../../models/order_model.dart';
import '../../utils/app_constants.dart';

class OrderRepo {
  final CartRepo cartRepo;

  OrderRepo(this.cartRepo);

  List<Order> listOfOrders = [];
  List<String> listOfOrdersSharedPreferences = [];



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


  }



  List<Order> getListOfOrders() {
    print("7 get order from shared preferences");
    if (cartRepo.sharedPreferences!
        .containsKey(AppConstants.ORDER_HISTORY_LIST)) {
      listOfOrdersSharedPreferences = [];
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
