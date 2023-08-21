import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/controller/order_controller.dart';
import 'package:food_delivery_with_backend/utils/colors.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';
import 'package:food_delivery_with_backend/widgets/app_icon.dart';
import 'package:food_delivery_with_backend/widgets/empty_cart.dart';
import 'package:food_delivery_with_backend/widgets/order_item.dart';
import 'package:get/get.dart';

import '../../widgets/big_text.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColor.mainColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.height * 0.017, vertical: Dimensions.height * 0.008),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(text: "Order History", color: Colors.white,),
                  AppIcon(
                    icon: Icons.shopping_cart_outlined,
                    onTapFunc: () {},
                    backgroundColor: AppColor.mainColor,
                    iconColor: Colors.black38,
                  )
                ],
              ),
            ),
          ),
          Get.find<OrderController>().getListOfOrders().isNotEmpty?GetBuilder<OrderController>(
            builder: (orderController) {
              return Expanded(
                child: ListView.builder(
                  itemCount: orderController.getListOfOrders().length,
                  itemBuilder: (context, index) {
                    return OrderItem(
                        order: orderController.listOfTotalOrders[index]);
                  },
                ),
              );
            },
          ):Expanded(child: EmptyCart()),
        ],
      ),
    );
  }
}
