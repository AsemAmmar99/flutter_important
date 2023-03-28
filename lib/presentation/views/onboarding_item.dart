import 'package:flutter/material.dart';
import 'package:flutter_important/data/models/onboarding_model.dart';
import 'package:flutter_important/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingModel model;

  const OnBoardingItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: Image.asset(
            model.image,
            fit: BoxFit.contain,
          ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.only(top: 2.h, bottom: 3.h),
            child: DefaultText(
              text: model.title,
              maxLines: 2,
              textAlign: TextAlign.start,
              textSize: 20.sp,
              weight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: DefaultText(
              text: model.body,
              maxLines: 4,
              textAlign: TextAlign.center,
              textSize: 14.sp,
              weight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
              textColor: Colors.grey[700],
            ),
          ),
        ),
      ],
    );
  }
}
