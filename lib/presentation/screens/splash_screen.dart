import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_important/presentation/screens/login_screen.dart';
import 'package:flutter_important/presentation/widgets/default_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(const Duration(milliseconds: 4000), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.withOpacity(0.4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/google.svg',
              fit: BoxFit.contain,
              width: 80.w,
              height: 30.h,
            ),
            DefaultText(
              text: 'Google',
              textSize: 20.sp,
              textColor: Colors.deepOrange,
              weight: FontWeight.bold,
              textStyle: FontStyle.italic,
            )
          ],
        ),
      ),
    );
  }
}
