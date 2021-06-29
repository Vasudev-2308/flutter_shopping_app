import 'package:flutter/material.dart';
import 'package:shopping_app/core/store.dart';
import 'package:shopping_app/screens/cart_page.dart';
import 'package:shopping_app/screens/homescreen.dart';
import 'package:shopping_app/screens/loginscreen.dart';
import 'package:shopping_app/utils/routes.dart';
import 'package:shopping_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() => runApp(
  VxState(
    store: MyStore(),
    interceptors: [],
    child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme:MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),//MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context)=>LoginScreen(),
        MyRoutes.loginRoute: (context) => LoginScreen(),
        MyRoutes.homeRoute: (context) => HomeScreen(),
        MyRoutes.cartRoute: (context)=>CartPage(),
        // MyRoutes.details:(context) =>Details()
      },
    );
  }
}
