import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/controller/user_controller.dart';
import 'package:food_delivery_with_backend/utils/colors.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';
import 'package:food_delivery_with_backend/widgets/big_text.dart';
import 'package:food_delivery_with_backend/widgets/profile_detail_items.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/circular_line_painter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<UserController>().isUserProfilePicUploaded();

    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Container(
            height: Dimensions.height * 0.07,
            color: AppColor.yellowColor,
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(
                    text: "Profile",
                    color: Colors.white,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.find<UserController>().logoutUser();
                    },
                    child: Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: Dimensions.height * 0.037,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: Dimensions.height * 0.03),
            height: Dimensions.height * 0.25,
            alignment: Alignment.center,
            color: AppColor.yellowColor,
            child: GetBuilder<UserController>(builder: (userController) {
              return Stack(
                children: [
                  CustomPaint(
                    painter: CircularLinePainter(
                      color: AppColor.mainColor,
                      strokeWidth: 4.0,
                    ),
                    child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(Dimensions.height * 0.1),
                        child: userController.isProfilePicUploaded == true &&
                                userController.image == null
                            ? Container(
                                height: Dimensions.height * 0.2,
                                width: Dimensions.height * 0.2,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        userController.imageUrl!,
                                      ),
                                      fit: BoxFit.cover),
                                ),
                              )
                            : userController.image == null
                                ? Container(
                                    height: Dimensions.height * 0.2,
                                    width: Dimensions.height * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/user_image3.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: Dimensions.height * 0.2,
                                    width: Dimensions.height * 0.2,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      image: DecorationImage(
                                        image: FileImage(userController.image!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )),
                  ),
                  Positioned(
                    bottom: 0,
                    right: Dimensions.height * 0.007,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(Dimensions.height * 0.025),
                      child: Container(
                        color: AppColor.mainColor,
                        width: Dimensions.height * 0.05,
                        height: Dimensions.height * 0.05,
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () async {
                            await userController.pickImage(ImageSource.gallery);
                          },
                          child: Icon(
                            Icons.camera_alt_sharp,
                            size: Dimensions.height * 0.035,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileDetailItems(
                      text: Get.find<UserController>().userName == null ? "User Name" : Get.find<UserController>().userName!,
                      icon: Icons.person,
                      iconOnTap: () {}),
                  SizedBox(
                    height: Dimensions.height * 0.01,
                  ),
                  ProfileDetailItems(
                      text: Get.find<UserController>().userPhone == null
                          ? "+92 314 --- -- ---"
                          : Get.find<UserController>().userPhone!,
                      icon: Icons.call,
                      iconOnTap: () {},
                      iconBackgroundColor: AppColor.yellowColor),
                  SizedBox(
                    height: Dimensions.height * 0.01,
                  ),
                  ProfileDetailItems(
                      text: Get.find<UserController>().userEmail == null ? "username@gmail.com" : Get.find<UserController>().userEmail!,
                      icon: Icons.email,
                      iconOnTap: () {},
                      iconBackgroundColor: AppColor.yellowColor),
                  SizedBox(
                    height: Dimensions.height * 0.01,
                  ),
                  ProfileDetailItems(
                      text: "Address",
                      icon: Icons.location_on,
                      iconOnTap: () {},
                      iconBackgroundColor: AppColor.yellowColor),
                  SizedBox(
                    height: Dimensions.height * 0.01,
                  ),
                  ProfileDetailItems(
                      text: "Additional Information",
                      icon: Icons.comment,
                      iconOnTap: () {},
                      iconBackgroundColor: Colors.redAccent),
                  SizedBox(
                    height: Dimensions.height * 0.01,
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
