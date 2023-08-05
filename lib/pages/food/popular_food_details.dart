import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/controller/popular_product_controller_dart.dart';
import 'package:food_delivery_with_backend/models/product_model.dart';
import 'package:food_delivery_with_backend/utils/app_constants.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';
import 'package:food_delivery_with_backend/widgets/app_icon.dart';
import 'package:food_delivery_with_backend/widgets/app_name_rating_icons.dart';
import 'package:food_delivery_with_backend/widgets/expandable_text.dart';
import 'package:food_delivery_with_backend/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';
import '../../utils/colors.dart';
import '../../widgets/big_text.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({Key? key, required this.products})
      : super(key: key);

  final Products products;

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().initProduct(products);

    return Scaffold(
        body: Container(
          height: double.infinity,
          child: Stack(
            children: [
              //for Image
              Container(
                height: Dimensions.height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        AppConstants.BASE_URL + "/uploads/" + products.img!,
                      ),
                      fit: BoxFit.cover),
                ),
              ),

              //for top app icons
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
                        Get.back();
                      },
                    ),
                    Stack(
                      children: [
                        AppIcon(
                          icon: Icons.shopping_cart_outlined,
                          onTapFunc: () {},
                        ),
                        GetBuilder<PopularProductController>(
                          builder: (popularProductController) => Positioned(
                              top: Dimensions.height * 0.006,
                              right: Dimensions.height * 0.006,
                              child:
                                  popularProductController.getTotalCartItems > 0
                                      ? Container(
                                          width: Dimensions.height * 0.02,
                                          height: Dimensions.height * 0.02,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.height * 0.011),
                                            color: AppColor.mainColor,
                                          ),
                                          alignment: Alignment.center,
                                          child: SmallText(
                                            text: popularProductController
                                                .getTotalCartItems
                                                .toString(),
                                            color: Colors.black,
                                            size: Dimensions.height * 0.015,
                                          ),
                                        )
                                      : Text("")),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              //for the rating, and description part
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
                      AppNameRatingIcons(
                        text: products.name!,
                        rating: products.stars!,
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
                      Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableText(
                            text: products.description!,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (popularProductController) => Container(
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
                //for cart items quantity increase decrease.
                Container(
                    padding: EdgeInsets.all(Dimensions.height * 0.02),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(Dimensions.height * 0.02),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () =>
                              popularProductController.setQuantity(false),
                          child: const Icon(
                            Icons.remove,
                            color: AppColor.signColor,
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.height * 0.01,
                        ),
                        BigText(
                            text: popularProductController.getQuantity
                                .toString()),
                        SizedBox(
                          width: Dimensions.height * 0.01,
                        ),
                        GestureDetector(
                          onTap: () =>
                              popularProductController.setQuantity(true),
                          child: const Icon(
                            Icons.add,
                            color: AppColor.signColor,
                          ),
                        )
                      ],
                    )),

                //for the price and AddToCart Button
                Container(
                  padding: EdgeInsets.all(Dimensions.height * 0.016),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.height * 0.02),
                    color: AppColor.mainColor,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      popularProductController.addItem(products);
                    },
                    child: BigText(
                      text:
                          "\$${products.price! * popularProductController.getQuantity} | Add to cart",
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
