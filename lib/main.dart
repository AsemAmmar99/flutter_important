import 'package:flutter/material.dart';
import 'package:flutter_important/presentation/screens/splash_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter App',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
