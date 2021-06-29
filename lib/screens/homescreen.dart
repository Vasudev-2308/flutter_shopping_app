import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_app/models/items.dart';
import 'package:shopping_app/utils/routes.dart';
import 'package:shopping_app/widgets/home_screen_widgets/headerwidget.dart';
import 'package:shopping_app/widgets/home_screen_widgets/listbuilder.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //final dummyList = List.generate(5, (index) => CatalogModel.items[0]);

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    loadData();
    super.initState();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final jsonfile = await rootBundle.loadString('assets/files/itemslist.json');
    //print(jsonfile);
    final decodedData = jsonDecode(jsonfile);

    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.theme.buttonColor,
        child: Icon(
          CupertinoIcons.cart_fill_badge_plus,
          size: 30,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader(),
              if (CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                Center(
                  child: CircularProgressIndicator().centered().expand(),
                )
            ],
          ),
        ),
      ),
    );
  }
}
