import 'package:food_delivery_with_backend/models/product_model.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  String? time;
  bool? isExist;
  Products? products;

  CartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.time,
    this.isExist,
    this.products,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json["quantity"];
    time = json["time"];
    isExist = json["isExist"];
    products = Products.fromJson(json["products"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name":this.name,
      "price": this.price,
      "img":this.img,
      "quantity": this.quantity,
      "time":this.time,
      "isExist":this.isExist,
      "products":this.products!.toJson(),
    };
  }
}
