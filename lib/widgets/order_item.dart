import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/models/order_model.dart';
import 'package:food_delivery_with_backend/pages/cart/see_order_details.dart';
import 'package:food_delivery_with_backend/utils/app_constants.dart';
import 'package:food_delivery_with_backend/utils/colors.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:food_delivery_with_backend/widgets/small_text.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key, required this.order}) : super(key: key);

  final Order order;

  String formatDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);

    String formattedTime = DateFormat('hh:mma').format(dateTime);
    String formattedDate = DateFormat('MM/dd/yyyy').format(dateTime);

    return '$formattedTime $formattedDate';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(
                  text: formatDateTime(order.time!),
                  color: Colors.black38,
                ),
                SmallText(
                  text: "Total",
                  color: Colors.black,
                )
              ],
            ),
            SizedBox(
              height: Dimensions.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Dimensions.width * 0.7,
                  height: Dimensions.height * 0.08,
                  // color: Colors.red,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: order.orderItems!.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(Dimensions.height * 0.015),
                          child: Container(
                            width: Dimensions.height * 0.085,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "${AppConstants.BASE_URL}/uploads/${order.orderItems![index].products!.img!}",
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${order.orderItems!.length} ITEMS",
                        style: TextStyle(fontSize: Dimensions.height * 0.02),
                      ),
                      SizedBox(
                        height: Dimensions.height * 0.005,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(()=>SeeOrderDetails(listOfOrderItems: order.orderItems!,));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: Dimensions.height * 0.005,
                              horizontal: Dimensions.height * 0.005),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: AppColor.mainColor, width: 2),
                              borderRadius: BorderRadius.circular(
                                  Dimensions.height * 0.01)),
                          child: Text(
                            "See Details",
                            style: TextStyle(fontSize: Dimensions.height * 0.015),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
