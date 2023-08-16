import 'cart_model.dart';

class Order {
  List<CartModel>? orderItems;
  String? time;

  Order({this.orderItems, this.time});

  Map<String, dynamic> toJson() {
    return {
      'orderItems': orderItems?.map((item) => item.toJson()).toList(),
      'time': time,
    };
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderItems: (json['orderItems'] as List<dynamic>?)
          ?.map((item) => CartModel.fromJson(item))
          .toList(),
      time: json['time'],
    );
  }
}