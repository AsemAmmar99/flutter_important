import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_important/presentation/styles/colors.dart';

class Themes {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
      colorScheme: const ColorScheme.light(
        primary: lightBlue,
        secondary: lightBlue,
      ),
      dividerTheme: const DividerThemeData(color: black),
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(iconColor: MaterialStatePropertyAll(black))),
      iconTheme: const IconThemeData(
        color: black,
      ),
      buttonTheme: const ButtonThemeData(buttonColor: lightPurple),
      scaffoldBackgroundColor: white,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: black),
        actionsIconTheme: IconThemeData(color: black),
        backgroundColor: lightBlue,
        titleTextStyle: TextStyle(color: black),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
      ),
      drawerTheme: const DrawerThemeData(backgroundColor: lightRed),
      sliderTheme: const SliderThemeData(
        inactiveTickMarkColor: Colors.transparent,
        activeTickMarkColor: Colors.transparent,
        activeTrackColor: lightPurple,
        inactiveTrackColor: Colors.grey,
      ),
      checkboxTheme: const CheckboxThemeData(
        checkColor: MaterialStatePropertyAll(black),
        fillColor: MaterialStatePropertyAll(lightPurple),
      ),
      dialogBackgroundColor: darkBlue,
      toggleButtonsTheme: const ToggleButtonsThemeData(
        selectedBorderColor: Colors.transparent,
        borderColor: Colors.transparent,
        fillColor: Colors.transparent,
      ));

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
      colorScheme: const ColorScheme.dark(
        primary: darkBlue,
        secondary: darkBlue,
      ),
      dividerTheme: const DividerThemeData(color: white),
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(iconColor: MaterialStatePropertyAll(white)),
      ),
      iconTheme: const IconThemeData(
        color: white,
      ),
      buttonTheme: const ButtonThemeData(buttonColor: darkPurple),
      scaffoldBackgroundColor: black,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: white),
        actionsIconTheme: IconThemeData(color: black),
        backgroundColor: darkBlue,
        titleTextStyle: TextStyle(color: white),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light),
      ),
      drawerTheme: const DrawerThemeData(backgroundColor: darkRed),
      sliderTheme: const SliderThemeData(
        inactiveTickMarkColor: Colors.transparent,
        activeTickMarkColor: Colors.transparent,
        activeTrackColor: darkPurple,
        inactiveTrackColor: Colors.grey,
      ),
      checkboxTheme: const CheckboxThemeData(
        checkColor: MaterialStatePropertyAll(white),
        fillColor: MaterialStatePropertyAll(darkPurple),
      ),
      dialogBackgroundColor: lightBlue,
      toggleButtonsTheme: const ToggleButtonsThemeData(
        selectedBorderColor: Colors.transparent,
        borderColor: Colors.transparent,
        fillColor: Colors.transparent,
      ));
}
