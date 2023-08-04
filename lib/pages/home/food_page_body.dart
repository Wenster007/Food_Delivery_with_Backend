import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/controller/popular_product_controller_dart.dart';
import 'package:food_delivery_with_backend/controller/recommended_food_controller.dart';
import 'package:food_delivery_with_backend/pages/food/popular_food_details.dart';
import 'package:food_delivery_with_backend/pages/food/recommended_food_details.dart';
import 'package:food_delivery_with_backend/routes/route_helper.dart';
import 'package:food_delivery_with_backend/utils/app_constants.dart';
import 'package:food_delivery_with_backend/utils/colors.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';
import 'package:food_delivery_with_backend/widgets/app_name_rating_icons.dart';
import 'package:food_delivery_with_backend/widgets/big_text.dart';
import 'package:food_delivery_with_backend/widgets/icon_and_text_widget.dart';
import 'package:food_delivery_with_backend/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../models/product_model.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  double _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  final double _height = Dimensions.height * 0.43;

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget _buildPageItem(int index, Products popularProduct) {
    Matrix4 matrix = Matrix4.identity();

    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            margin: EdgeInsets.only(
                left: Dimensions.height * 0.015,
                right: Dimensions.height * 0.015),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.height * 0.04),
              color: index.isEven
                  ? const Color(0xFF69c5df)
                  : const Color(0xFF9294cc),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    AppConstants.BASE_URL + "/uploads/" + popularProduct.img!),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(
                top: Dimensions.height * 0.012,
                left: Dimensions.height * 0.01,
                right: Dimensions.height * 0.01,
              ),
              height: Dimensions.height * 0.15,
              margin: EdgeInsets.only(
                  left: Dimensions.height * 0.03,
                  right: Dimensions.height * 0.03,
                  bottom: Dimensions.height * 0.04),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height * 0.04),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                ],
              ),
              child: AppNameRatingIcons(
                  text: popularProduct.name!, rating: popularProduct.stars!),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //for displaying the main image and the box container
        GetBuilder<PopularProductController>(
            builder: (popularProductController) {
          return popularProductController.isLoaded
              ? Container(
                  height: Dimensions.height * 0.43,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: popularProductController.getProductList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(PopularFoodDetails(products: popularProductController.getProductList[index],));
                        },
                        child: _buildPageItem(index,
                            popularProductController.getProductList[index]),
                      );
                    },
                  ),
                )
              : Container(
                  height: Dimensions.height * 0.43,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.mainColor,
                    ),
                  ),);
        }),

        //For displaying the Active Page Dots.
        GetBuilder<PopularProductController>(
            builder: (popularProductController) {
          return DotsIndicator(
            dotsCount: popularProductController.getProductList.isEmpty
                ? 1
                : popularProductController.getProductList.length,
            position: _currPageValue.round(),
            decorator: DotsDecorator(
              activeColor: AppColor.mainColor,
              size: Size.square(Dimensions.height * 0.013),
              activeSize:
                  Size(Dimensions.height * 0.024, Dimensions.height * 0.0125),
              activeShape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(Dimensions.height * 0.008)),
            ),
          );
        }),

        SizedBox(
          height: Dimensions.height * 0.02,
        ),

        //Popular - Food Pairing heading row.
        Padding(
          padding: EdgeInsets.only(left: Dimensions.height * 0.03),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(
                width: Dimensions.height * 0.008,
              ),
              Container(
                margin: EdgeInsets.only(bottom: Dimensions.height * 0.003),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.height * 0.008,
              ),
              Container(
                margin: EdgeInsets.only(bottom: Dimensions.height * 0.003),
                child: SmallText(text: "Food Pairing"),
              ),
            ],
          ),
        ),

        //list of food and images
        GetBuilder<RecommendedProductController>(
            builder: (recommendedProductController) {
          return recommendedProductController.isLoaded
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedProductController.getProductList.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Get.to(RecommendedFoodDetails(products: recommendedProductController.getProductList[index]), transition: Transition.fadeIn);
                    },
                    child: Container(
                      // color: Colors.red,
                      margin: EdgeInsets.only(
                        left: Dimensions.height * 0.03,
                        right: Dimensions.height * 0.03,
                        bottom: Dimensions.height * 0.02,
                      ),
                      child: Row(
                        children: [
                          //image container
                          Container(
                            height: Dimensions.height * 0.15,
                            width: Dimensions.height * 0.17,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.height * 0.01),
                              color: index / 2 == 0
                                  ? const Color(0xFF9294cc)
                                  : const Color(0xFF69c5df),
                              image: DecorationImage(
                                  image: NetworkImage(AppConstants.BASE_URL +
                                      "/uploads/" +
                                      recommendedProductController
                                          .getProductList[index].img!),
                                  fit: BoxFit.cover),
                            ),
                          ),

                          //text Container
                          Expanded(
                            child: Container(
                              height: Dimensions.height * 0.14,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight:
                                      Radius.circular(Dimensions.height * 0.01),
                                  topRight:
                                      Radius.circular(Dimensions.height * 0.01),
                                ),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: Dimensions.height * 0.01,
                                  top: Dimensions.height * 0.01,
                                  right: Dimensions.height * 0.01,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BigText(
                                        text: recommendedProductController
                                            .getProductList[index].name!),
                                    SizedBox(
                                      height: Dimensions.height * 0.008,
                                    ),
                                    Container(
                                      height: Dimensions.height * 0.028,
                                      child: SmallText(
                                          text: recommendedProductController
                                              .getProductList[index]
                                              .description!),
                                    ),
                                    SizedBox(
                                      height: Dimensions.height * 0.008,
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndTextWidget(
                                          icon: Icons.circle,
                                          iconColor: AppColor.iconColor1,
                                          text: "Normal",
                                        ),
                                        IconAndTextWidget(
                                            icon: Icons.location_on,
                                            iconColor: AppColor.mainColor,
                                            text: "1.7km"),
                                        IconAndTextWidget(
                                            icon: Icons.access_time_rounded,
                                            iconColor: AppColor.iconsColor2,
                                            text: "32min")
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  height: Dimensions.height * 0.3,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.mainColor,
                    ),
                  ),
                );
        }),
      ],
    );
  }
}
