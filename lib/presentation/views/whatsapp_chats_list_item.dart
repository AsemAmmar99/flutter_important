import 'package:flutter/material.dart';
import 'package:flutter_important/presentation/styles/colors.dart';
import 'package:flutter_important/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

class WhatsappChatsListItem extends StatelessWidget {
  const WhatsappChatsListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 3.w),
            child: ClipOval(
              child: Image.asset(
                'assets/avatar.png',
                height: 7.h,
                width: 7.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: DefaultText(
                        text: 'Asem Ammar',
                        textColor: white,
                        weight: FontWeight.bold,
                        textSize: 14.sp,
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(top: 0.5.h),
                        child: DefaultText(
                          text: '12:00 AM',
                          textColor: floatingActionButtonColor,
                          textSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 21,
                        child: DefaultText(
                          text:
                              'Hello all! How are you? I hope you are all fine.',
                          textColor: textsColor,
                          weight: FontWeight.bold,
                          textSize: 13.sp,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      Flexible(
                        flex: 2,
                        child: CircleAvatar(
                          backgroundColor: floatingActionButtonColor,
                          radius: 10.sp,
                          child: DefaultText(
                            text: '2',
                            textSize: 9.sp,
                            textColor: backgroundColor,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
