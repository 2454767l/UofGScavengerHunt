import 'package:flutter/material.dart';

const double standardPadding = 20.0;

const progressGradient = LinearGradient(
  colors: [Colors.green, Colors.greenAccent],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

class newTheme {
  final Color _navyBlue = Color.fromRGBO(0, 56, 101, 20);
  final Color _burgundy = Color.fromRGBO(125, 34, 57, 100);
  final Color _leaf = Color.fromRGBO(0, 132, 61, 25);
  final Color _lavender = Color.fromRGBO(91, 77, 148, 100);

  final Color _lightGrey = Color.fromARGB(255, 164, 164, 164);
  final Color _darkerGrey = Color.fromARGB(255, 199, 124, 135);
  final Color _lightGreen = Color.fromARGB(255, 213, 235, 220);

  ThemeData buildTheme() {
    return ThemeData(
        canvasColor: _navyBlue,
        primaryColor: _navyBlue,
        secondaryHeaderColor:_burgundy ,
        hintColor: _lightGrey,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: _lightGrey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: _leaf,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(0, 132, 61, 25),
              onPrimary: Colors.white,
            ),
        ),
        appBarTheme: AppBarTheme(color: _lavender, titleTextStyle: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          fontFamily: "Swiss-721-BT",
        )),
        buttonTheme: ButtonThemeData(
            buttonColor: _darkerGrey,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            minWidth: 150,
            height: 40.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: _lightGrey),

    );
  }
}

/*ThemeData(
appBarTheme: const AppBarTheme(titleTextStyle: AppBarTextStyle),
textTheme: const TextTheme(
titleLarge: TitleTextStyle,
bodyMedium: bodyTextStyle,
)),*/
