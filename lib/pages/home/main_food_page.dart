import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/controller/order_controller.dart';
import 'package:food_delivery_with_backend/utils/colors.dart';
import 'package:food_delivery_with_backend/pages/home/food_page_body.dart';
import 'package:food_delivery_with_backend/widgets/big_text.dart';
import 'package:food_delivery_with_backend/widgets/small_text.dart';

import 'package:food_delivery_with_backend/utils/dimensions.dart';

import '../../controller/cart_controller.dart';
import 'package:get/get.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  void loadResources() {
    Get.find<CartController>().getCartData();
    Get.find<OrderController>().getListOfOrders();
  }

  @override
  Widget build(BuildContext context) {
    loadResources();
    return Scaffold(
      body: Column(
        children: [
          //For showing the header
          Container(
            margin: EdgeInsets.only(
              top: Dimensions.height * 0.05,
              bottom: Dimensions.height * 0.02,
            ),
            padding: EdgeInsets.only(
                left: Dimensions.height * 0.03,
                right: Dimensions.height * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                      text: "Pakistan",
                      color: AppColor.mainColor,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: "Peshawar",
                          color: Colors.black54,
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: Dimensions.height * 0.063,
                  width: Dimensions.height * 0.063,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.height * 0.018),
                    color: AppColor.mainColor,
                  ),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: Dimensions.height * 0.033,
                  ),
                ),
              ],
            ),
          ),

          //For displaying the carousel
          const Expanded(child: SingleChildScrollView(child: FoodPageBody())),

          //
        ],
      ),
    );
  }
}
