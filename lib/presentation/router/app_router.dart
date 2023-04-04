import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_important/core/constants.dart' as screens;
import 'package:flutter_important/presentation/screens/home_screen.dart';
import 'package:flutter_important/presentation/screens/login_screen.dart';
import 'package:flutter_important/presentation/screens/onboarding_screen.dart';
import 'package:flutter_important/presentation/screens/whatsapp/whatsapp_home_layout.dart';

class AppRouter {
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings){
    startScreen = const WhatsappHomeLayout();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case screens.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
        case screens.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case screens.whatsappScreen:
        return MaterialPageRoute(builder: (_) => const WhatsappHomeLayout());
        case screens.homeScreen:
          final Map data = settings.arguments as Map;
          final String myName = data['name'];
          final String myPassword = data['password'];
          if (kDebugMode) {
            print(myPassword);
          }
        return MaterialPageRoute(builder: (_) => HomeScreen(myName: myName,));
      default:
        return null;
    }
  }
}