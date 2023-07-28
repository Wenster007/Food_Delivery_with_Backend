import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  AppIcon({
    Key? key,
    required this.icon,
    this.backgroundColor = const Color(0xFFfcf4e4),
    this.iconColor = const Color(0xFF756d54),
    this.size = 0,
    this.iconSize = 0, required this.onTapFunc,
  }) : super(key: key);

  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;
  final void Function() onTapFunc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunc,
      child: Container(
        width: size==0? Dimensions.height * 0.055: size,
        height: size==0? Dimensions.height * 0.055: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size==0? Dimensions.height * 0.055: size / 2),
          color: backgroundColor,
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize == 0? Dimensions.height * 0.028: iconSize,
        ),
      ),
    );
  }
}
