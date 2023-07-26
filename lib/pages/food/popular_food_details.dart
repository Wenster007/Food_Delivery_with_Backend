import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';
import 'package:food_delivery_with_backend/widgets/app_icon.dart';
import 'package:food_delivery_with_backend/widgets/app_name_rating_icons.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              height: Dimensions.height * 0.4,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/food1.jpg",
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: Dimensions.height * 0.045,
                horizontal: Dimensions.height * 0.025,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios_new_outlined,
                    onTapFunc: () {},
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart_outlined,
                    onTapFunc: () {},
                  ),
                ],
              ),
            ),
            Positioned(
              top: Dimensions.height * 0.4 - 25,
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height * 0.015,
                  left: Dimensions.height * 0.015,
                  right: Dimensions.height * 0.015,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.height * 0.02),
                      topLeft: Radius.circular(Dimensions.height * 0.02)),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppNameRatingIcons(
                      text: "Range Of Burgers",
                    ),
                    SizedBox(
                      height: Dimensions.height * 0.03,
                    ),
                    BigText(
                      text: "Introduce",
                      size: Dimensions.height * 0.035,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: Dimensions.height * 0.13,
        color: Colors.red,
        padding: EdgeInsets.only(
          top: Dimensions.height * 0.03,
          bottom: Dimensions.height * 0.03,
          left: Dimensions.height * 0.02,
          right: Dimensions.height * 0.02,
        ),
      ),
    );
  }
}
