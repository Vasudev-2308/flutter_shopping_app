import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: GoogleFonts.poppinsTextTheme(),
      cardColor: Colors.white,
      accentColor: darkBlue,
      buttonColor: darkBlue,
      canvasColor: MyTheme.cream,
      primarySwatch: Colors.deepPurple,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
        centerTitle: true,
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      accentColor: Colors.white,
      cardColor: Colors.grey[800],
      buttonColor: lightBluish,
      canvasColor: MyTheme.darkColor,
      appBarTheme: AppBarTheme(
        //color: Colors.black,
        elevation: 0.0,
        toolbarTextStyle: TextStyle(color: Colors.white),
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: Theme.of(context).textTheme.copyWith(
          headline6: context.textTheme.headline6!.copyWith(color: Colors.white)
        ),
        centerTitle: true,
      ));

  static Color cream = Color(0xfff5f5f5);
  static Color darkBlue = Color(0xff050A30);
  static Color darkColor = Vx.gray800;
  static Color lightBluish = Vx.indigo500;
}
