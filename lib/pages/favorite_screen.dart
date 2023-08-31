import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/controller/favorite_controller.dart';
import 'package:food_delivery_with_backend/utils/colors.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';
import 'package:food_delivery_with_backend/widgets/favorite_screen_item.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<FavoriteController>().getFavItemsFromSharedPreferences();

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            width: double.infinity,
            alignment: Alignment.centerLeft,
            color: AppColor.yellowColor,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.height * 0.02,
                  vertical: Dimensions.height * 0.015),
              child: Text(
                "Favorites",
                style: TextStyle(
                    fontSize: Dimensions.height * 0.028,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
          GetBuilder<FavoriteController>(
                  builder: (favController) => favController.getItemsList().isNotEmpty ? Expanded(
                    child: ListView.builder(
                      itemCount: favController.getItemsList().length,
                      itemBuilder: (context, index) => FavoriteScreenItem(
                        product:
                            Get.find<FavoriteController>().getItemsList()[index],
                      ),
                    ),
                  ): Expanded(
                    child: Center(
                      child: Image.asset(
                        "assets/images/empty_cart2.png",
                        width: Dimensions.width * 0.85,
                      ),
                    ),
                  ),
                )

        ]),
      ),
    );
  }
}
