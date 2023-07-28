import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';

class SmallText extends StatelessWidget {
  SmallText(
      {Key? key,
        this.color = const Color(0xFFccc7c5),
        required this.text,
        this.size = 0,
        this.height = 1.4,
        })
      : super(key: key);

  final Color color;
  final String text;
  double size;
  double height;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Roboto",
        height: height,
        color: color,
        fontSize: size == 0? Dimensions.height * 0.017 : size,
      ),
    );
  }
}
