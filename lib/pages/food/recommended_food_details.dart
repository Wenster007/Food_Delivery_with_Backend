import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/controller/favorite_controller.dart';
import 'package:food_delivery_with_backend/controller/recommended_food_controller.dart';
import 'package:food_delivery_with_backend/models/product_model.dart';
import 'package:food_delivery_with_backend/pages/cart/cart_pages.dart';
import 'package:food_delivery_with_backend/utils/app_constants.dart';
import 'package:food_delivery_with_backend/utils/colors.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';
import 'package:food_delivery_with_backend/widgets/app_icon.dart';
import 'package:food_delivery_with_backend/widgets/big_text.dart';
import 'package:food_delivery_with_backend/widgets/expandable_text.dart';
import 'package:get/get.dart';

import '../../widgets/small_text.dart';

class RecommendedFoodDetails extends StatelessWidget {
  const RecommendedFoodDetails({Key? key, required this.products})
      : super(key: key);

  final Products products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          //for image and the title text
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    icon: Icons.clear,
                    onTapFunc: () {
                      Get.back();
                    }),
                Stack(
                  children: [
                    AppIcon(
                      icon: Icons.shopping_cart_outlined,
                      onTapFunc: () {
                        Get.off(() => CartPage(
                              cameFromProduct: products,
                              cameFromPopularProduct: false,
                            ));
                      },
                    ),
                    GetBuilder<RecommendedProductController>(
                      builder: (recommendedPopularController) => Positioned(
                          top: Dimensions.height * 0.006,
                          right: Dimensions.height * 0.006,
                          child:
                              recommendedPopularController.getTotalCartItems > 0
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
                                        text: recommendedPopularController
                                            .getTotalCartItems
                                            .toString(),
                                        color: Colors.black,
                                        size: Dimensions.height * 0.015,
                                      ),
                                    )
                                  : Text("")),
                    ),
                  ],
                ),
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
                child: BigText(text: products.name!),
              ),
            ),
            expandedHeight: Dimensions.height * 0.35,
            pinned: true,
            backgroundColor: const Color.fromARGB(255, 222, 184, 22),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL + "/uploads/" + products.img!,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Dimensions.height * 0.02),
                  child: ExpandableText(
                    text: products.description!,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: Dimensions.height * 0.1),
              child: GetBuilder<RecommendedProductController>(
                builder: (recommendedProductController) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIcon(
                        icon: Icons.remove,
                        backgroundColor: AppColor.mainColor,
                        onTapFunc: () {
                          recommendedProductController.setQuantity(false);
                        },
                        iconSize: Dimensions.height * 0.037,
                        iconColor: Colors.white),
                    BigText(
                      text:
                          "\$${products.price}.00 X ${recommendedProductController.getQuantity}",
                      color: AppColor.mainBlackColor,
                    ),
                    AppIcon(
                      icon: Icons.add,
                      backgroundColor: AppColor.mainColor,
                      onTapFunc: () {
                        recommendedProductController.setQuantity(true);
                      },
                      iconSize: Dimensions.height * 0.037,
                      iconColor: Colors.white,
                    )
                  ],
                ),
              )),
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
                GetBuilder<FavoriteController>(
                  builder: (favController) => GestureDetector(
                    onTap: () {
                      favController.addItemToFavorite(products);
                    },
                    child: Container(
                      padding: EdgeInsets.all(Dimensions.height * 0.02),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(Dimensions.height * 0.02),
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: favController.isFavorite(products)
                            ? Colors.red
                            : AppColor.mainColor,
                        size: Dimensions.height * 0.03,
                      ),
                    ),
                  ),
                ),
                GetBuilder<RecommendedProductController>(
                  builder: (recommendedProductController) => GestureDetector(
                    onTap: () {
                      recommendedProductController.addItem(products);
                    },
                    child: Container(
                      padding: EdgeInsets.all(Dimensions.height * 0.016),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.height * 0.02),
                        color: AppColor.mainColor,
                      ),
                      child: BigText(
                        text:
                            "\$${products.price! * recommendedProductController.getQuantity} | Add to cart",
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
