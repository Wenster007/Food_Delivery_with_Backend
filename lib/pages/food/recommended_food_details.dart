import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/utils/colors.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';
import 'package:food_delivery_with_backend/widgets/app_icon.dart';
import 'package:food_delivery_with_backend/widgets/big_text.dart';
import 'package:food_delivery_with_backend/widgets/expandable_text.dart';

class RecommendedFoodDetails extends StatelessWidget {
  const RecommendedFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          //for image and the title text
          SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear, onTapFunc: () {}),
                AppIcon(icon: Icons.shopping_cart_outlined, onTapFunc: () {}),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height * 0.06),
              child: Container(
                padding:
                EdgeInsets.symmetric(vertical: Dimensions.height * 0.01),
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.height * 0.03),
                    topLeft: Radius.circular(Dimensions.height * 0.03),
                  ),
                ),
                child: BigText(text: "Range Of Burgers"),
              ),
            ),
            expandedHeight: Dimensions.height * 0.35,
            pinned: true,
            backgroundColor: const Color.fromARGB(255, 222, 184, 22),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/food1.jpg",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin:
                    EdgeInsets.symmetric(horizontal: Dimensions.height * 0.02),
                    child: const ExpandableText(
                        text:
                        "Instructions: In a mixing bowl, combine ground beef, chopped onion, minced garlic, Worcestershire sauce, Dijon mustard, salt, and black pepper. Shape into 4 patties. Grill or cook patties on a skillet over medium-high heat for 4-5 minutes per side. Add cheese (optional) during the last minute of cooking. Toast burger buns. Assemble burgers by placing a lettuce leaf on the bottom bun, followed by a patty with melted cheese (if using), tomato slices, pickles, and other toppings. Optionally, spread ketchup and mustard on the top bun. Serve and enjoy! Customize with your favorite toppings. Instructions: In a mixing bowl, combine ground beef, chopped onion, minced garlic, Worcestershire sauce, Dijon mustard, salt, and black pepper. Shape into 4 patties. Grill or cook patties on a skillet over medium-high heat for 4-5 minutes per side. Add cheese (optional) during the last minute of cooking. Toast burger buns. Assemble burgers by placing a lettuce leaf on the bottom bun, followed by a patty with melted cheese (if using), tomato slices, pickles, and other toppings. Optionally, spread ketchup and mustard on the top bun. Serve and enjoy! Customize with your favorite toppings. Instructions: In a mixing bowl, combine ground beef, chopped onion, minced garlic, Worcestershire sauce, Dijon mustard, salt, and black pepper. Shape into 4 patties. Grill or cook patties on a skillet over medium-high heat for 4-5 minutes per side. Add cheese (optional) during the last minute of cooking. Toast burger buns. Assemble burgers by placing a lettuce leaf on the bottom bun, followed by a patty with melted cheese (if using), tomato slices, pickles, and other toppings. Optionally, spread ketchup and mustard on the top bun. Serve and enjoy! Customize with your favorite toppings. Instructions: In a mixing bowl, combine ground beef, chopped onion, minced garlic, Worcestershire sauce, Dijon mustard, salt, and black pepper. Shape into 4 patties. Grill or cook patties on a skillet over medium-high heat for 4-5 minutes per side. Add cheese (optional) during the last minute of cooking. Toast burger buns. Assemble burgers by placing a lettuce leaf on the bottom bun, followed by a patty with melted cheese (if using), tomato slices, pickles, and other toppings. Optionally, spread ketchup and mustard on the top bun. Serve and enjoy! Customize with your favorite toppings."),
                  )
                ],
              ))
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.height * 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    icon: Icons.remove,
                    backgroundColor: AppColor.mainColor,
                    onTapFunc: () {},
                    iconSize: Dimensions.height * 0.037,
                    iconColor: Colors.white),
                BigText(text: "\$10.00 X 0", color: AppColor.mainBlackColor,),
                AppIcon(
                  icon: Icons.add,
                  backgroundColor: AppColor.mainColor,
                  onTapFunc: () {},
                  iconSize: Dimensions.height * 0.037,
                  iconColor: Colors.white,
                )
              ],
            ),
          ),
          Container(
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
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        Dimensions.height * 0.02),
                  ),
                  child: Icon(Icons.favorite, color: AppColor.mainColor,
                    size: Dimensions.height * 0.03,),
                ),
                Container(
                  padding: EdgeInsets.all(Dimensions.height * 0.016),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        Dimensions.height * 0.02),
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
        ],
      ),

    );
  }
}
