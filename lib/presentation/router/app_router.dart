import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_important/core/screens.dart' as screens;
import 'package:flutter_important/presentation/screens/colors_palette_screen.dart';
import 'package:flutter_important/presentation/screens/home_screen.dart';
import 'package:flutter_important/presentation/screens/login_screen.dart';
import 'package:flutter_important/presentation/screens/map_screen.dart';
import 'package:flutter_important/presentation/screens/onboarding_screen.dart';
import 'package:flutter_important/presentation/screens/users_screen.dart';
import 'package:flutter_important/presentation/screens/whatsapp/whatsapp_home_layout.dart';
import '../screens/provider_counter.dart';
import '../screens/settings_screens.dart';
import '../screens/stream_builder_counter.dart';

class AppRouter {
  late Widget startScreen;
  String name = 'Asem';

  Route? onGenerateRoute(RouteSettings settings){
    startScreen = const LoginScreen();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case screens.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
        case screens.settingsScreen:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case screens.mapScreen:
        return MaterialPageRoute(builder: (_) => const MapScreen());
        case screens.usersScreen:
        return MaterialPageRoute(builder: (_) => const UsersScreen());
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