import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/utils/colors.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';
import 'package:food_delivery_with_backend/widgets/app_icon.dart';

class ProfileDetailItems extends StatelessWidget {
  const ProfileDetailItems(
      {Key? key,
      required this.icon,
      required this.iconOnTap,
      required this.text,
      this.iconBackgroundColor = AppColor.mainColor})
      : super(key: key);

  final IconData icon;
  final void Function() iconOnTap;
  final String text;
  final Color iconBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.height * 0.007),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 1,
            spreadRadius: 1,
            blurStyle: BlurStyle.outer),
      ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: Dimensions.height * 0.017),
        child: Row(
          children: [
            AppIcon(
              icon: icon,
              onTapFunc: iconOnTap,
              size: Dimensions.height * 0.068,
              iconSize: Dimensions.height * 0.035,
              backgroundColor: iconBackgroundColor,
              iconColor: Colors.white,
            ),
            SizedBox(
              width: Dimensions.height * 0.02,
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: Dimensions.height * 0.025,
                  overflow: TextOverflow.ellipsis,
                  
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
