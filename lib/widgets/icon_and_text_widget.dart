import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';
import 'package:food_delivery_with_backend/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  const IconAndTextWidget(
      {Key? key,
      required this.icon,
      required this.iconColor,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.height * 0.03,
        ),
        const SizedBox(width: 5,),
        SmallText(text: text, size: Dimensions.height * 0.016,),
      ],
    );
  }

  final IconData icon;
  final Color iconColor;
  final String text;
}
