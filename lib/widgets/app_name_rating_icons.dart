import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppNameRatingIcons extends StatelessWidget {
  const AppNameRatingIcons({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.height * 0.032,
        ),
        SizedBox(
          height: Dimensions.height * 0.008,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                    (index) => Icon(
                  Icons.star,
                  color: AppColor.mainColor,
                  size: Dimensions.height * 0.025,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SmallText(
              text: "5",
              size: Dimensions.height * 0.019,
            ),
            const SizedBox(
              width: 10,
            ),
            SmallText(
              text: "1287 Comments",
              size: Dimensions.height * 0.019,
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.height * 0.016,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                icon: Icons.circle,
                iconColor: AppColor.iconColor1,
                text: "Normal",),
            IconAndTextWidget(
                icon: Icons.location_on,
                iconColor: AppColor.mainColor,
                text: "1.7km"),
            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                iconColor: AppColor.iconsColor2,
                text: "32min"),
          ],
        )
      ],
    );
  }
}
