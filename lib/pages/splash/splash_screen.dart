import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/controller/user_controller.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../controller/popular_product_controller_dart.dart';
import '../../controller/recommended_food_controller.dart';

import "package:food_delivery_with_backend/helper/dependencies3.dart" as dep3;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  _loadResources() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
    dep3.init();
  }

  @override
  void initState() {
    super.initState();
    _loadResources();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..forward();

    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    Timer(const Duration(seconds: 5), () {
      Get.find<UserController>().isUserLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScaleTransition(
          scale: animation,
          child: Center(
              child: Image.asset(
            "assets/images/logo.png",
            width: Dimensions.height * 0.28,
          ))),
    );
  }
}
