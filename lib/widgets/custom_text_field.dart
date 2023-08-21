import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.controller, required this.labelText, this.isHiddenPass = false, required this.icon}) : super(key: key);

  final TextEditingController controller;
  final IconData icon;
  final String labelText;
  final bool isHiddenPass;



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: Dimensions.height * 0.04,
          right: Dimensions.height * 0.04),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.height * 0.03),
        boxShadow: [
          BoxShadow(
              blurRadius: 5,
              spreadRadius: 3,
              offset: const Offset(1, 3),
              color: Colors.grey.withOpacity(0.3),
              blurStyle: BlurStyle.outer)
        ],
      ),
      child: TextField(
        obscureText: isHiddenPass,
        controller: controller,
        decoration: InputDecoration(
          hintText: labelText,
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: Icon(icon),
          prefixIconColor: AppColor.mainColor,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
