import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';

class BigText extends StatelessWidget {
  BigText(
      {Key? key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.size = 0,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  final Color color;
  final String text;
  double size;
  TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Roboto",
        fontWeight: FontWeight.w500,
        color: color,
        fontSize: size == 0? Dimensions.height * 0.028 : size,
        overflow: overflow,
      ),
    );
  }
}
