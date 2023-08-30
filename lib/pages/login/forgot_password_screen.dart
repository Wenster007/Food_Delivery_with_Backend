import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/controller/user_controller.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';
import 'package:food_delivery_with_backend/widgets/app_icon.dart';
import 'package:food_delivery_with_backend/widgets/big_text.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: Dimensions.height * 0.03, top: Dimensions.height * 0.03),
                      child: AppIcon(
                        icon: Icons.arrow_back,
                        onTapFunc: () => Get.back(),
                        backgroundColor: Colors.white,
                        iconColor: Colors.black,
                        size: Dimensions.height * 0.03,
                      ),
                    )
                  ],
                ),
                Image.asset(
                  "assets/images/forgot_password.png",
                  width: Dimensions.width * 0.8,
                  height: Dimensions.width * 0.8,
                ),
                SizedBox(
                  width: Dimensions.width * 0.8,
                  child: Text(
                    "Enter the email address associated with this account.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: Dimensions.width * 0.057,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height * 0.02,
                ),
                SizedBox(
                  width: Dimensions.width * 0.65,
                  child: Text(
                    "We will send you a link to reset your account.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: Dimensions.width * 0.042, color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height * 0.04,
                ),
                SizedBox(
                  width: Dimensions.width * 0.8,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Enter Email Address",
                      hintStyle: TextStyle(
                          fontSize: Dimensions.width * 0.042,
                          color: Colors.grey,
                          fontWeight: FontWeight.w300),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: Dimensions.height * 0.04,
                ),
                GetBuilder<UserController>(
                  builder: (userController) => GestureDetector(
                    onTap: () async {
                      await userController.sendForgotPasswordEmail(emailController.text);
                    },
                    child: Container(
                      width: Dimensions.height * 0.2,
                      height: Dimensions.height * 0.07,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.height * 0.15),
                        color: AppColor.mainColor,
                      ),
                      alignment: Alignment.center,
                      child: userController.isLoading ? const CircularProgressIndicator(color: Colors.white,) : BigText(
                        text: "Send",
                        color: Colors.white,
                        size: Dimensions.height * 0.027,
                      ),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
