import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/pages/splash/splash_screen.dart';
import 'package:get/get.dart';
import 'package:food_delivery_with_backend/helper/dependencies.dart' as dep;
import 'package:food_delivery_with_backend/helper/dependencies2.dart' as dep2;


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dep.init();
  dep2.init();
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
      home: const SplashScreen(),
      // getPages: RouteHelper.routes,
    );
  }
}

