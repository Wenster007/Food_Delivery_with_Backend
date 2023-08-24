import 'package:food_delivery_with_backend/models/product_model.dart';

class UserFirebaseData {
  int? phone;
  List<CartItem>? cartItems;
  String? name;
  String? email;

  UserFirebaseData({
    this.phone,
    this.cartItems,
    this.name,
    this.email,
  });

  UserFirebaseData.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    if (json['cart_items'] != null) {
      var cartItemsList = json['cart_items'] as List<dynamic>;
      cartItems = cartItemsList.map((itemJson) => CartItem.fromJson(itemJson)).toList();
    }
    name = json['name'];
    email = json['email'];
  }
}

class CartItem {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  String? time;
  bool? isExist;
  Products? products;

  CartItem({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.time,
    this.isExist,
    this.products,
  });

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    time = json['time'];
    isExist = json['isExist'];
    products = Products.fromJson(json['products']);
  }

}
