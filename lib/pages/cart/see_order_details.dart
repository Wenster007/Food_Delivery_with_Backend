import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/controller/order_controller.dart';
import 'package:food_delivery_with_backend/models/cart_model.dart';
import 'package:food_delivery_with_backend/widgets/order_detail_item.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import 'package:get/get.dart';

import '../../widgets/big_text.dart';
import '../home/home_page.dart';

class SeeOrderDetails extends StatelessWidget {
  const SeeOrderDetails({Key? key, required this.listOfOrderItems})
      : super(key: key);

  final List<CartModel> listOfOrderItems;

  @override
  Widget build(BuildContext context) {
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
                  AppIcon(
                    icon: Icons.home_outlined,
                    onTapFunc: () {
                      Get.offAll(() => const HomePage());
                    },
                    backgroundColor: AppColor.mainColor,
                    iconColor: Colors.white,
                  ),
                ],
              ),

              SizedBox(
                height: Dimensions.height * 0.02,
              ),

              //Cart Items List
              Expanded(
                child: ListView.builder(
                  itemCount: listOfOrderItems.length,
                  itemBuilder: (context, index) {
                    return OrderDetailItem(orderItem: listOfOrderItems[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //for cart items quantity increase decrease.
            Container(
                padding: EdgeInsets.all(Dimensions.height * 0.02),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.height * 0.02),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: Dimensions.height * 0.01,
                    ),
                    BigText(
                        text:
                            "Total : \$${Get.find<OrderController>().getTotalOrderAmount(listOfOrderItems)}"),
                    SizedBox(
                      width: Dimensions.height * 0.01,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
