import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/pages/food/popular_food_details.dart';
import 'package:food_delivery_with_backend/pages/food/recommended_food_details.dart';
import 'package:food_delivery_with_backend/pages/home/main_food_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RecommendedFoodDetails(),
    );
  }
}

