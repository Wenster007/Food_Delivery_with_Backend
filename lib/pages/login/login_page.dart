import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/controller/user_controller.dart';
import 'package:food_delivery_with_backend/pages/login/forgot_password_screen.dart';
import 'package:food_delivery_with_backend/pages/login/sign_up_page.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/small_text.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height * 0.03,
            ),
            Container(
              height: Dimensions.height * 0.23,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                        fontSize: Dimensions.height * 0.08,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SmallText(
                    text: "Sign into your account",
                    size: Dimensions.height * 0.025,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height * 0.04,
            ),

            //TextInput Form
            Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: emailController,
                    labelText: "Email",
                    icon: Icons.mail,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "     Enter Email";
                      }

                      bool isEmailValid(String email) {
                        const pattern =
                            r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                        final regex = RegExp(pattern);
                        return regex.hasMatch(email);
                      }

                      if (!isEmailValid(value)) {
                        return "     Incorrect Email Format";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: Dimensions.height * 0.04,
                  ),
                  CustomTextField(
                    controller: passController,
                    labelText: "Password",
                    isHiddenPass: true,
                    icon: Icons.key,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "     Enter Password";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: Dimensions.height * 0.025,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(()=>const ForgotPasswordScreen());
                        },
                      text: "Forgot Password?",
                      style: TextStyle(
                          fontSize: Dimensions.height * 0.02,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height * 0.05,
            ),

            GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    Get.find<UserController>().loginUser(
                        emailController.text.toString(),
                        passController.text.toString());
                  }
                },
                child: GetBuilder<UserController>(
                  builder: (userController) => Container(
                    width: Dimensions.height * 0.26,
                    height: Dimensions.height * 0.08,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.height * 0.15),
                      color: AppColor.mainColor,
                    ),
                    alignment: Alignment.center,
                    child: userController.isLoading ? const CircularProgressIndicator(color: Colors.white, ) : BigText(
                      text: "Sign In",
                      color: Colors.white,
                      size: Dimensions.height * 0.027,
                    ),
                  ),
                )),

            SizedBox(
              height: Dimensions.height * 0.1,
            ),
            RichText(
              text: TextSpan(
                text: "Don\'t have an account? ",
                style: TextStyle(
                    fontSize: Dimensions.height * 0.0225, color: Colors.grey),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(() => SignUpPage(), transition: Transition.fade);
                      },
                    text: "Create?",
                    style: TextStyle(
                        fontSize: Dimensions.height * 0.0225,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
