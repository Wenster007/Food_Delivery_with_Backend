import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';
import 'package:food_delivery_with_backend/widgets/custom_text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passController = TextEditingController();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
              CustomTextField(
                controller: emailController,
                labelText: "Email",
                icon: Icons.email,
              ),
              SizedBox(
                height: Dimensions.height * 0.03,
              ),
              CustomTextField(
                controller: passController,
                labelText: "Password",
                isHiddenPass: true,
                icon: Icons.key,
              ),

              SizedBox(
                height: Dimensions.height * 0.03,
              ),
              CustomTextField(
                controller: passController,
                labelText: "Password",
                isHiddenPass: true,
                icon: Icons.key,
              ),

              SizedBox(
                height: Dimensions.height * 0.03,
              ),
              CustomTextField(
                controller: passController,
                labelText: "Password",
                isHiddenPass: true,
                icon: Icons.key,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
