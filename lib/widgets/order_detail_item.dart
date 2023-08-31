import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/widgets/small_text.dart';

import '../models/cart_model.dart';
import '../utils/app_constants.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';

class OrderDetailItem extends StatelessWidget {
  const OrderDetailItem({Key? key, required this.orderItem}) : super(key: key);

  final CartModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height * 0.15,
      // color: Colors.red,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.height * 0.035),
              child: Container(
                height: Dimensions.height * 0.13,
                width: Dimensions.height * 0.13,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "${AppConstants.BASE_URL}/uploads/${orderItem.img}",
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimensions.height * 0.01,
                ),
                BigText(text: orderItem.name!),
                SmallText(text: "Spicy"),
                SizedBox(
                  height: Dimensions.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(
                      text: "\$ ${orderItem.price}.00",
                      color: Colors.red,
                    ),
                    SmallText(text: "x ${orderItem.quantity.toString()}", color: Colors.black54, size: Dimensions.height*0.025),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
