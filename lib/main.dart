import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/controller/popular_product_controller_dart.dart';
import 'package:food_delivery_with_backend/controller/recommended_food_controller.dart';
import 'package:food_delivery_with_backend/pages/home/main_food_page.dart';
import 'package:get/get.dart';
import 'package:food_delivery_with_backend/helper/dependencies.dart' as dep;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainFoodPage(),
    );
  }
}

