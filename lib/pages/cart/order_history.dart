import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/controller/order_controller.dart';
import 'package:food_delivery_with_backend/utils/colors.dart';
import 'package:food_delivery_with_backend/widgets/order_item.dart';
import 'package:get/get.dart';

import '../../widgets/big_text.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: BigText(text: "Orders History"),

        backgroundColor: AppColor.mainColor,
      ),
      body: GetBuilder<OrderController>(
        builder: (orderController) {
          return ListView.builder(
            itemCount: orderController.getListOfOrders().length,
            itemBuilder: (context, index) {
              return OrderItem(order: orderController.listOfTotalOrders[index]);
            },
          );
        },
      ),
    );
  }
}
