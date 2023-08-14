import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/pages/home/home_page.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../controller/popular_product_controller_dart.dart';
import '../../controller/recommended_food_controller.dart';


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


    Timer(
      const Duration(seconds: 5),
      () => Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomePage(),
      )),
    );


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
