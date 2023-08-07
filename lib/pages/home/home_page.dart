import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/pages/home/main_food_page.dart';
import 'package:food_delivery_with_backend/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List Pages = [
    const MainFoodPage(),
    Container(
      child: const Center(
        child: Text("1"),
      ),
    ),
    Container(
      child: const Center(
        child: Text("2"),
      ),
    ),
    Container(
      child: const Center(
        child: Text("3"),
      ),
    ),
    Container(
      child: const Center(
        child: Text("4"),
      ),
    ),
  ];

  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[activePage],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColor.mainColor,
        unselectedItemColor: AppColor.yellowColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: activePage,

        onTap: (index) {
          setState(() {
            activePage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined), label: "History"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_sharp), label: "Me"),
        ],
      ),
    );
  }
}
