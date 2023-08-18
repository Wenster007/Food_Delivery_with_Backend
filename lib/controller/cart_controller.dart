import 'package:food_delivery_with_backend/data/repository/cart_repo.dart';
import 'package:food_delivery_with_backend/models/cart_model.dart';
import 'package:food_delivery_with_backend/models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo? cartRepo;

  CartController(this.cartRepo);

  Map<int, CartModel> items = {};
  List<CartModel> storageItems = [];

  //for adding items to cart
  void addItem(Products product, int quantity) {
    //if addToCart is clicked and the item already exists it will just add the quantity
    if (items.containsKey(product.id)) {
      items.update(product.id!, (oldProduct) {
        return CartModel(
          id: oldProduct.id,
          name: oldProduct.name,
          price: oldProduct.price,
          quantity: oldProduct.quantity! + quantity,
          img: oldProduct.img,
          isExist: true,
          time: DateTime.now().toString(),
          products: product,
        );
      });
    }
    //if the item is not present it will add the complete new product to the list.
    else {
      items.putIfAbsent(product.id!, () {
        return CartModel(
          id: product.id,
          name: product.name,
          price: product.price,
          quantity: quantity,
          img: product.img,
          isExist: true,
          time: DateTime.now().toString(),
          products: product,
        );
      });
    }
    print("1");
    cartRepo!.addToCartList(getItemsList());
  }

  //for converting the Map into list of CartModel
  List<CartModel> getItemsList() {
    return items.entries.map((e) => e.value).toList();
  }

  //it is used to get the quantity of total cart-items.
  int get getTotalCartItems {
    int totalQuantity = 0;
    items.forEach((key, value) {
      totalQuantity = totalQuantity + value.quantity!;
    });
    return totalQuantity;
  }

  //for increasing and decreasing the quantity of item in the cart
  void quantityIncrementDecrement(int itemKey, bool isIncrement) {
    items.forEach((key, value) {
      if (key == itemKey) {
        if (isIncrement) {
          value.quantity = value.quantity! + 1;
        } else {
          value.quantity = value.quantity! - 1;
          if (value.quantity == 0) {
            items.remove(key);
          }
        }
        cartRepo!.addToCartList(getItemsList());
        update();
      }
    });
  }

  //for getting the total amount of the items in the cart.
  int get totalAmount {
    int totalAmount = 0;
    items.forEach((key, value) {
      totalAmount = totalAmount + (value.price! * value.quantity!);
    });

    return totalAmount;
  }

  //for loading the cart data from sharedPreferences when the app is reExecuted.--------------------------------------
  List<CartModel> getCartData() {
    setCart = cartRepo!.getCartList();
    return storageItems;
  }

  set setCart(List<CartModel> item) {
    storageItems = item;

    for (int i = 0; i < storageItems.length; i++) {
      items.putIfAbsent(storageItems[i].products!.id!, () => storageItems[i]);
    }
  }

  //--------------------------------------------------------------------------------------------------------------

  //for adding the cart-items to CartHistory once the order is completed.
  void addToHistory() {
    cartRepo!.addToCartHistoryList();
    Get.snackbar("Order Completed",
        "Your Order has been placed. You can check your order in Order History");
    items = {};
    update();
  }
}
