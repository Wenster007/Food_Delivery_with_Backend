import 'package:food_delivery_with_backend/data/repository/order_repo.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';
import '../models/order_model.dart';

class OrderController extends GetxController{
  final OrderRepo orderRepo;

  OrderController(this.orderRepo);

  Map<String, Order> mapOfOrders = {};
  List<Order> storage=[];

  //to addDataTosharedreferences
  void addOrderHistory() {
    orderRepo.addOrderToSharedPreferences();
    update();
  }

  //to get data from sharedPreferences and add it to the current list.
  List<Order> getListOfOrders(){
    storage = orderRepo.getListOfOrders();

    for (int i=0; i<storage.length; i++){
      mapOfOrders.putIfAbsent(storage[i].time!, () => storage[i]);
    }

    return listOfTotalOrders;
  }

  //for converting map into list.
  List<Order> get listOfTotalOrders {
    return mapOfOrders.entries.map((e) => e.value).toList().reversed.toList();
  }

  //for calculating the total amount of each order
  int getTotalOrderAmount(List<CartModel> listOfOrders){
    int total = 0;

    listOfOrders.forEach((element) {
      total = total + (element.price!*element.quantity!.toInt());
    });
    return total;
  }
}