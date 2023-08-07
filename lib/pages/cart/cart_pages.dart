import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/utils/app_constants.dart';
import 'package:food_delivery_with_backend/utils/colors.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';
import 'package:food_delivery_with_backend/widgets/app_icon.dart';
import 'package:food_delivery_with_backend/widgets/big_text.dart';
import 'package:food_delivery_with_backend/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';
import '../home/main_food_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

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
                      Get.back();
                    },
                    backgroundColor: AppColor.mainColor,
                    iconColor: Colors.white,
                  ),
                  Row(
                    children: [
                      AppIcon(
                        icon: Icons.home_outlined,
                        onTapFunc: () {
                          Get.offAll(()=> const MainFoodPage());
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
                    builder: (cartController) =>  itemMap.isNotEmpty ?ListView.builder(
                        itemCount: itemMap.length,
                        itemBuilder: (context, index) {
                          int key = itemMap.keys.elementAt(index);
                          return Container(
                            height: Dimensions.height * 0.15,
                            // color: Colors.red,
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.height * 0.035),
                                  child: Container(
                                    height: Dimensions.height * 0.13,
                                    width: Dimensions.height * 0.13,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "${AppConstants.BASE_URL}/uploads/${itemMap[key]!.img!}",),
                                      ),
                                      color: Colors.white,
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
                                      SizedBox(height: Dimensions.height * 0.006,),
                                      BigText(text: itemMap[key]!.name!),
                                      SmallText(text: "Spicy"),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(
                                            text:
                                            "\$ ${itemMap[key]!.price! * itemMap[key]!.quantity!}.00",
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
                                                width: Dimensions.height *
                                                    0.01,
                                              ),
                                              BigText(
                                                text: itemMap[key]!
                                                    .quantity!
                                                    .toString(),
                                              ),
                                              SizedBox(
                                                width: Dimensions.height *
                                                    0.01,
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
                        }) : const Center(child: Text("No Items In the Cart"),),)


              )
            ],
          ),
        ),
      ),
    );
  }
}
