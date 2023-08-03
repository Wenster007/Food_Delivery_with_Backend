import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';
import 'package:food_delivery_with_backend/widgets/app_icon.dart';
import 'package:food_delivery_with_backend/widgets/app_name_rating_icons.dart';
import 'package:food_delivery_with_backend/widgets/expandable_text.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';

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
                    onTapFunc: () {
                      Navigator.of(context).pop();
                    },
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
                    SizedBox(
                      height: Dimensions.height * 0.02,
                    ),
                    const Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableText(
                            text:
                                "Instructions: In a mixing bowl, combine ground beef, chopped onion, minced garlic, Worcestershire sauce, Dijon mustard, salt, and black pepper. Shape into 4 patties. Grill or cook patties on a skillet over medium-high heat for 4-5 minutes per side. Add cheese (optional) during the last minute of cooking. Toast burger buns. Assemble burgers by placing a lettuce leaf on the bottom bun, followed by a patty with melted cheese (if using), tomato slices, pickles, and other toppings. Optionally, spread ketchup and mustard on the top bun. Serve and enjoy! Customize with your favorite toppings."),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(Dimensions.height * 0.02),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.height * 0.02),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.remove,
                    color: AppColor.signColor,
                  ),
                  SizedBox(
                    width: Dimensions.height * 0.01,
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: Dimensions.height * 0.01,
                  ),
                  const Icon(
                    Icons.add,
                    color: AppColor.signColor,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(Dimensions.height * 0.016),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height * 0.02),
                color: AppColor.mainColor,
              ),
              child: BigText(
                text: "\$10 | Add to cart",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
