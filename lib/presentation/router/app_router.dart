import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_important/core/constants.dart' as screens;
import 'package:flutter_important/presentation/screens/bloc_counter.dart';
import 'package:flutter_important/presentation/screens/colors_palette_screen.dart';
import 'package:flutter_important/presentation/screens/home_screen.dart';
import 'package:flutter_important/presentation/screens/login_screen.dart';
import 'package:flutter_important/presentation/screens/onboarding_screen.dart';
import 'package:flutter_important/presentation/screens/splash_screen.dart';
import 'package:flutter_important/presentation/screens/whatsapp/whatsapp_home_layout.dart';

import '../screens/provider_counter.dart';
import '../screens/stream_builder_counter.dart';

class AppRouter {
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings){
    startScreen = const ColorsPaletteScreen();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case screens.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
        case screens.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case screens.whatsappScreen:
        return MaterialPageRoute(builder: (_) => const WhatsappHomeLayout());
        case screens.streamBuilderCounterScreen:
        return MaterialPageRoute(builder: (_) => const StreamBuilderCounter());
        case screens.providerCounterScreen:
        return MaterialPageRoute(builder: (_) => const ProviderCounter());
        case screens.colorsPaletteScreen:
        return MaterialPageRoute(builder: (_) => const ColorsPaletteScreen());

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