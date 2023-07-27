import 'package:flutter/material.dart';
import 'package:food_delivery_with_backend/utils/colors.dart';
import 'package:food_delivery_with_backend/utils/dimensions.dart';
import 'package:food_delivery_with_backend/widgets/small_text.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();

  final String text;
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimensions.height * 0.43;

  @override
  void initState() {
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: secondHalf.isEmpty
            ? SmallText(text: firstHalf, size: Dimensions.height * 0.021, color: AppColor.paraColor,)
            : Column(
                children: [
                  SmallText(
                    text: hiddenText
                        ? ("$firstHalf ...")
                        : ("$firstHalf $secondHalf"),
                    size: Dimensions.height * 0.021,
                    color: AppColor.paraColor,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        hiddenText = !hiddenText;
                      });
                    },
                    child: hiddenText?Row(
                      children: [
                        SmallText(
                          text: "Show more",
                          color: AppColor.mainColor,
                          size: Dimensions.height * 0.021,
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: AppColor.mainColor,
                        ),
                      ],
                    ): Row(
                      children: [
                        SmallText(
                          text: "Show Less",
                          color: AppColor.mainColor,
                          size: Dimensions.height * 0.021,
                        ),
                        const Icon(
                          Icons.keyboard_arrow_up_sharp,
                          color: AppColor.mainColor,
                        ),
                      ],
                    )
                  )
                ],
              ));
  }
}
