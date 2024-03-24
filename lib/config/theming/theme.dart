import 'package:flutter/material.dart';

import '../helpers/hex_color.dart';

class KTheme {
  static Color mainColor = Colors.amber;
  static Color greyColor = HexColor("#808081");
  static Color backgroundColor = HexColor("#1C2126");
  static Color greyButtonsColor = HexColor("#2C2C2E");

  static ThemeData darkTheme() => ThemeData(
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(backgroundColor),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: HexColor("#2C2C2E"),
          elevation: 0.0,
          selectedItemColor: mainColor,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          unselectedItemColor: Colors.grey.withOpacity(.4),
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0.0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          hintStyle: TextStyle(
            color: greyColor,
          ),
          contentPadding: const EdgeInsets.all(10.0),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red.withOpacity(.7),
            ),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red.withOpacity(.7),
            ),
          ),
          suffixIconColor: greyColor,
          prefixIconColor: greyColor,
        ),
        fontFamily: 'Cairo',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsetsDirectional.only(start: 10.0),
            shadowColor: mainColor,
            elevation: 5.0,
            backgroundColor: mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        scaffoldBackgroundColor: backgroundColor,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
        ),
      );
}
