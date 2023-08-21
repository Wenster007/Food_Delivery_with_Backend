import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/utils/colors.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';
import 'package:food_delivery_with_backend/widgets/app_icon.dart';
import 'package:food_delivery_with_backend/widgets/big_text.dart';
import 'package:food_delivery_with_backend/widgets/profile_detail_items.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: Dimensions.height * 0.07,
          color: AppColor.mainColor,
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: BigText(
              text: "Profile",
              color: Colors.white,
            ),
          ),
        ),
        Container(
          height: Dimensions.height * 0.25,
          alignment: Alignment.center,
          child: AppIcon(
            icon: Icons.person,
            backgroundColor: AppColor.mainColor,
            onTapFunc: () {},
            iconSize: Dimensions.height * 0.1,
            size: Dimensions.height * 0.2,
            iconColor: Colors.white,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
              child: Column(
            children: [
              ProfileDetailItems(
                  text: "Ahmed", icon: Icons.person, iconOnTap: () {}),
              SizedBox(
                height: Dimensions.height * 0.01,
              ),
              ProfileDetailItems(
                  text: "+92314 --- -- ---",
                  icon: Icons.call,
                  iconOnTap: () {},
                  iconBackgroundColor: AppColor.yellowColor),
              SizedBox(
                height: Dimensions.height * 0.01,
              ),
              ProfileDetailItems(
                  text: "Infacts22@gmail.com",
                  icon: Icons.email,
                  iconOnTap: () {},
                  iconBackgroundColor: AppColor.yellowColor),
              SizedBox(
                height: Dimensions.height * 0.01,
              ),
              ProfileDetailItems(
                  text: "Address",
                  icon: Icons.location_on,
                  iconOnTap: () {},
                  iconBackgroundColor: AppColor.yellowColor),
              SizedBox(
                height: Dimensions.height * 0.01,
              ),
              ProfileDetailItems(
                  text: "Additional Information",
                  icon: Icons.comment,
                  iconOnTap: () {},
                  iconBackgroundColor: Colors.redAccent),
              SizedBox(
                height: Dimensions.height * 0.01,
              ),
            ],
          )),
        )
      ]),
    );
  }
}
