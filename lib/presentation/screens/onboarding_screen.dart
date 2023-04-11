import 'package:flutter/material.dart';
import 'package:flutter_important/business_logic/providers/onboarding_provider.dart';
import 'package:flutter_important/presentation/views/onboarding_item.dart';
import 'package:flutter_important/presentation/widgets/default_material_button.dart';
import 'package:flutter_important/presentation/widgets/default_text.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/default_text_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  late OnBoardingProvider providerForData;
  late OnBoardingProvider providerForMethods;


  @override
  void didChangeDependencies() {
    providerForMethods = Provider.of<OnBoardingProvider>(context, listen: false);
    providerForData = Provider.of<OnBoardingProvider>(context, listen: true);
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrange,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Visibility(
              visible: !providerForData.isLast,
              child: CircleAvatar(
                radius: 20.sp,
                backgroundColor: Colors.orangeAccent,
                child: DefaultTextButton(
                  onPressed: () => providerForMethods.finishOnBoarding(context),
                  child: const DefaultText(
                    text: 'Skip',
                    textColor: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: DefaultText(
                text: 'Hello!',
                textSize: 30.sp,
                textColor: Colors.indigo,
                weight: FontWeight.bold,
                textStyle: FontStyle.italic,
              ),
            ),
            Expanded(
                child: PageView.builder(
                    itemBuilder: (context, index) => OnBoardingItem(model: providerForData.onBoardingList[index]),
                  itemCount: providerForData.onBoardingList.length,
                  physics: const BouncingScrollPhysics(),
                  controller: providerForData.onBoardingPageController,
                  onPageChanged: (index) => providerForMethods.checkIfLast(index),
                ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: SmoothPageIndicator(
                  controller: providerForData.onBoardingPageController,
                  count: providerForData.onBoardingList.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.orangeAccent,
                    activeDotColor: Colors.teal,
                    expansionFactor: 3,
                    dotHeight: 3.w,
                    dotWidth: 3.w,
                    spacing: 3.w
                  ),
              ),
            ),
            if(providerForData.isLast)
            DefaultMaterialButton(
                onPressed: () => providerForMethods.finishOnBoarding(context),
                backgroundColor: Colors.transparent,
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              height: 6.h,
              radius: 25.sp,
              child: const DefaultText(
                text: 'Get Started',
                weight: FontWeight.bold,
                textColor: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: DefaultText(
                      text: "Don't have an account?",
                      textSize: 12.sp,
                      textColor: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: DefaultText(
                      text: 'Sign Up Now!',
                      textSize: 12.sp,
                      textColor: Colors.blue,
                      weight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
