import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/controller/order_controller.dart';
import 'package:food_delivery_with_backend/controller/popular_product_controller_dart.dart';
import 'package:food_delivery_with_backend/models/product_model.dart';
import 'package:food_delivery_with_backend/pages/food/popular_food_details.dart';
import 'package:food_delivery_with_backend/pages/food/recommended_food_details.dart';
import 'package:food_delivery_with_backend/pages/home/home_page.dart';
import 'package:food_delivery_with_backend/utils/app_constants.dart';
import 'package:food_delivery_with_backend/utils/colors.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';
import 'package:food_delivery_with_backend/widgets/app_icon.dart';
import 'package:food_delivery_with_backend/widgets/big_text.dart';
import 'package:food_delivery_with_backend/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage(
      {Key? key,
      required this.cameFromProduct,
      required this.cameFromPopularProduct})
      : super(key: key);

  final Products cameFromProduct;
  final bool cameFromPopularProduct;

  @override
  Widget build(BuildContext context) {
    final itemMap = Get.find<CartController>().items;

    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8,
              left: 12,
              right: 12,
            ),
            child: Column(
              children: [
                //Icons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIcon(
                      icon: Icons.arrow_back_ios_new_outlined,
                      onTapFunc: () {
                        if (cameFromPopularProduct) {
                          Get.off(() =>
                              PopularFoodDetails(products: cameFromProduct));
                        } else {
                          Get.off(() => RecommendedFoodDetails(
                              products: cameFromProduct));
                        }
                      },
                      backgroundColor: AppColor.mainColor,
                      iconColor: Colors.white,
                    ),
                    Row(
                      children: [
                        AppIcon(
                          icon: Icons.home_outlined,
                          onTapFunc: () {
                            Get.offAll(() => const HomePage());
                          },
                          backgroundColor: AppColor.mainColor,
                          iconColor: Colors.white,
                        ),
                        SizedBox(
                          width: Dimensions.width * 0.04,
                        ),
                        AppIcon(
                          icon: Icons.shopping_cart_outlined,
                          onTapFunc: () {},
                          backgroundColor: AppColor.mainColor,
                          iconColor: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(
                  height: Dimensions.height * 0.02,
                ),

                //Cart Items List
                Expanded(
                    child: GetBuilder<CartController>(
                  builder: (cartController) => Get.find<CartController>().items.isNotEmpty
                      ? ListView.builder(
                          itemCount: itemMap.length,
                          itemBuilder: (context, index) {
                            int key = itemMap.keys.elementAt(index);
                            return Container(
                              height: Dimensions.height * 0.15,
                              // color: Colors.red,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      final int popularIndex =
                                          Get.find<PopularProductController>()
                                              .getProductList
                                              .indexOf(itemMap[key]!.products!);
                                      print(popularIndex);
                                      if (popularIndex >= 0) {
                                        Get.to(() => PopularFoodDetails(
                                            products: itemMap[key]!.products!));
                                      } else {
                                        Get.to(() => RecommendedFoodDetails(
                                            products: itemMap[key]!.products!));
                                      }
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.height * 0.035),
                                      child: Container(
                                        height: Dimensions.height * 0.13,
                                        width: Dimensions.height * 0.13,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              "${AppConstants.BASE_URL}/uploads/${itemMap[key]!.img!}",
                                            ),
                                          ),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimensions.width * 0.02,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: Dimensions.height * 0.006,
                                        ),
                                        BigText(text: itemMap[key]!.name!),
                                        SmallText(text: "Spicy"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(
                                              text:
                                                  "\$ ${itemMap[key]!.price!}.00",
                                              color: Colors.red,
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(
                                                  Dimensions.height * 0.02),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.height *
                                                            0.02),
                                              ),
                                              child: Row(children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    cartController
                                                        .quantityIncrementDecrement(
                                                            key, false);
                                                  },
                                                  child: const Icon(
                                                    Icons.remove,
                                                    color: AppColor.signColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width:
                                                      Dimensions.height * 0.01,
                                                ),
                                                BigText(
                                                  text: itemMap[key]!
                                                      .quantity!
                                                      .toString(),
                                                ),
                                                SizedBox(
                                                  width:
                                                      Dimensions.height * 0.01,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    cartController
                                                        .quantityIncrementDecrement(
                                                            key, true);
                                                  },
                                                  child: const Icon(
                                                    Icons.add,
                                                    color: AppColor.signColor,
                                                  ),
                                                ),
                                              ]),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          })
                      : const Center(
                          child: Text("No Items In the Cart"),
                        ),
                ))
              ],
            ),
          ),
        ),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (cartController) => Container(
            height: Dimensions.height * 0.13,
            padding: EdgeInsets.only(
              top: Dimensions.height * 0.03,
              bottom: Dimensions.height * 0.03,
              left: Dimensions.height * 0.02,
              right: Dimensions.height * 0.02,
            ),
            decoration: BoxDecoration(
              color: AppColor.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.height * 0.02),
                topRight: Radius.circular(Dimensions.height * 0.02),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //for cart items quantity increase decrease.
                Container(
                    padding: EdgeInsets.all(Dimensions.height * 0.02),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(Dimensions.height * 0.02),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: Dimensions.height * 0.01,
                        ),
                        BigText(text: "\$ ${cartController.totalAmount}"),
                        SizedBox(
                          width: Dimensions.height * 0.01,
                        ),
                      ],
                    )),

                Container(
                  padding: EdgeInsets.all(Dimensions.height * 0.016),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.height * 0.02),
                    color: AppColor.mainColor,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (cartController.totalAmount<1){
                        Get.snackbar("No Items in Cart", "Add atleast 1 item in cart to place an order.");
                        return;
                      }
                      cartController.addToHistory();
                      Get.find<OrderController>().addOrderHistory();
                    },
                    child: BigText(
                      text: " Add to cart",
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
