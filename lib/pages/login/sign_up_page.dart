import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/controller/user_controller.dart';
import 'package:food_delivery_with_backend/utils/colors.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';
import 'package:food_delivery_with_backend/widgets/big_text.dart';
import 'package:food_delivery_with_backend/widgets/custom_text_field.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passController = TextEditingController();
    final nameController = TextEditingController();
    final phoneController = TextEditingController();


    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: Dimensions.height * 0.04,
            ),
            Container(
              height: Dimensions.height * 0.2,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height * 0.03,
            ),

            //Text Input Form
            Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: nameController,
                    labelText: "Name",
                    icon: Icons.person,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "     Enter Name";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: Dimensions.height * 0.04,
                  ),
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
                    controller: phoneController,
                    labelText: "Phone",
                    icon: Icons.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "     Enter Phone Number";
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
                    height: Dimensions.height * 0.05,
                  ),
                ],
              ),
            ),

            GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    Get.find<UserController>().createUser(
                      emailController.text,
                      passController.text,
                      nameController.text,
                      phoneController.text,
                    );
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
                    child: userController.isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : BigText(
                            text: "Sign Up",
                            color: Colors.white,
                            size: Dimensions.height * 0.027,
                          ),
                  ),
                )),

            SizedBox(
              height: Dimensions.height * 0.01,
            ),
            RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.back();
                  },
                text: "Already have an account?",
                style: TextStyle(
                    fontSize: Dimensions.height * 0.02, color: Colors.grey),
              ),
            ),
            SizedBox(
              height: Dimensions.height * 0.015,
            ),
            Text(
              "OR",
              style: TextStyle(
                  fontSize: Dimensions.height * 0.02, color: Colors.grey),
            ),
            SizedBox(
              height: Dimensions.height * 0.015,
            ),
            Text(
              "Sign up using the following method.",
              style: TextStyle(
                  fontSize: Dimensions.height * 0.02, color: Colors.grey),
            ),
            SizedBox(
              height: Dimensions.height * 0.01,
            ),

            GestureDetector(
              onTap: () async {
                await Get.find<UserController>().loginThroughGoogle();
              },
              child: Container(
                width: Dimensions.height * 0.29,
                height: Dimensions.height * 0.08,
                decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage("assets/images/g2.png")),
                  borderRadius:
                  BorderRadius.circular(Dimensions.height * 0.15),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
