import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/pages/cart/order_history.dart';
import 'package:food_delivery_with_backend/pages/home/main_food_page.dart';
import 'package:food_delivery_with_backend/utils/colors.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [
    const MainFoodPage(),
    Container(
      child: const Center(
        child: Text("1"),
      ),
    ),
    OrderHistory(),
    Container(
      child: const Center(
        child: Text("3"),
      ),
    ),

  ];

  final List<PersistentBottomNavBarItem> _navBarsItems = [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home),
      title: ("Home"),
      activeColorPrimary: AppColor.mainColor,
      inactiveColorPrimary: AppColor.yellowColor,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.archive),
      title: ("Archive"),
      activeColorPrimary: AppColor.mainColor,
      inactiveColorPrimary: AppColor.yellowColor,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.shopping_cart),
      title: ("Cart"),
      activeColorPrimary: AppColor.mainColor,
      inactiveColorPrimary: AppColor.yellowColor,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.person),
      title: ("Me"),
      activeColorPrimary: AppColor.mainColor,
      inactiveColorPrimary: AppColor.yellowColor,
    ),

  ];

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: pages[activePage],
  //     bottomNavigationBar: BottomNavigationBar(
  //       selectedItemColor: AppColor.mainColor,
  //       unselectedItemColor: AppColor.yellowColor,
  //       showSelectedLabels: false,
  //       showUnselectedLabels: false,
  //       currentIndex: activePage,
  //
  //       onTap: (index) {
  //         setState(() {
  //           activePage = index;
  //         });
  //       },
  //       items: const [
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.home_outlined), label: "Home"),
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.archive_outlined), label: "History"),
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.person_outline_sharp), label: "Me"),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller =
        PersistentTabController(initialIndex: 0);
    return PersistentTabView(
      context,
      screens: pages,
      controller: _controller,
      items: _navBarsItems,
      navBarStyle: NavBarStyle.style9,
      navBarHeight: Dimensions.height * 0.09,
    );
  }
}
