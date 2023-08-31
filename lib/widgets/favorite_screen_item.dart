import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/models/product_model.dart';
import 'package:food_delivery_with_backend/pages/food/recommended_food_details.dart';
import 'package:food_delivery_with_backend/widgets/small_text.dart';

import '../controller/favorite_controller.dart';
import '../utils/app_constants.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'package:get/get.dart';

class FavoriteScreenItem extends StatelessWidget {
  const FavoriteScreenItem({Key? key, required this.product}) : super(key: key);

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.width * 0.04),
      height: Dimensions.height * 0.17,
      // color: Colors.red,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(()=>RecommendedFoodDetails(products: product));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.height * 0.035),
              child: Container(
                height: Dimensions.height * 0.13,
                width: Dimensions.height * 0.13,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "${AppConstants.BASE_URL}/uploads/${product.img}",
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
                BigText(text: product.name!),
                SmallText(text: "Spicy"),
                SizedBox(
                  height: Dimensions.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(
                      text: "\$ ${product.price}.00",
                      color: Colors.red,
                    ),

                    GetBuilder<FavoriteController>(
                      builder: (favController) => GestureDetector(
                        onTap: () {
                          favController.addItemToFavorite(product);
                        },
                        child: Container(
                          padding: EdgeInsets.all(Dimensions.height * 0.02),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius:
                            BorderRadius.circular(Dimensions.height * 0.02),
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: favController.isFavorite(product)
                                ? Colors.red
                                : AppColor.mainColor,
                            size: Dimensions.height * 0.03,
                          ),
                        ),
                      ),
                    ),
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
