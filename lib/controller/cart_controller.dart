import 'package:food_delivery_with_backend/data/repository/cart_repo.dart';
import 'package:food_delivery_with_backend/models/cart_model.dart';
import 'package:food_delivery_with_backend/models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> items = {};

  void addItem(Products product, int quantity) {

    //if addToCart is clicked and the item already exists it will just add the quantity
    if (items.containsKey(product.id)){
      items.update(product.id!, (oldProduct) {
        return CartModel(
          id: oldProduct.id,
          name: oldProduct.name,
          price: oldProduct.price,
          quantity: oldProduct.quantity! + quantity,
          img: oldProduct.img,
          isExit: true,
          time: DateTime.now().toString(),
        );
      });
    }
    //if the item is not present it will add the complete new product to the list.
    else {
      items.putIfAbsent(
          product.id!,
              () {
            return CartModel(
              id: product.id,
              name: product.name,
              price: product.price,
              quantity: quantity,
              img: product.img,
              isExit: true,
              time: DateTime.now().toString(),
            );
          }
      );
    }
  }

  int get getTotalCartItems{
    int totalQuantity= 0;
    items.forEach((key, value) {
      totalQuantity = totalQuantity + value.quantity!;
    });
    return totalQuantity;
  }


}
