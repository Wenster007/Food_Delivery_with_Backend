import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          Container(
            width: Dimensions.height * 0.4,
            height: Dimensions.height * 0.4,
            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/empty_cart.png"))),
          ),
    );
  }
}
