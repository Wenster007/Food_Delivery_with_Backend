import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/pages/cart/order_history.dart';
import 'package:food_delivery_with_backend/pages/favorite_screen.dart';
import 'package:food_delivery_with_backend/pages/home/main_food_page.dart';
import 'package:food_delivery_with_backend/pages/profile/profile_page.dart';
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
    const FavoriteScreen(),
    const OrderHistory(),
    const ProfilePage(),
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
