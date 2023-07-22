import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/colors.dart';
import 'package:food_delivery_with_backend/widgets/big_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 45, bottom: 15,),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Column(
                  children: [
                    BigText(text: "Bangladesh", color: AppColor.mainColor,),
                    Text("City"),
                  ],
                ),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColor.mainColor,
                  ),
                  child: const Icon(Icons.search, color: Colors.white, ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
