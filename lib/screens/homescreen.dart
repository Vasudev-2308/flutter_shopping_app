import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/core/store.dart';
import 'package:shopping_app/models/cart_model.dart';
import 'package:shopping_app/models/items.dart';
import 'package:shopping_app/utils/routes.dart';
import 'package:shopping_app/widgets/home_screen_widgets/headerwidget.dart';
import 'package:shopping_app/widgets/home_screen_widgets/listbuilder.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  
  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, _, _a) => FloatingActionButton(
          backgroundColor: context.theme.buttonColor,
          child: Icon(
            CupertinoIcons.cart_fill_badge_plus,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(
              context,
              MyRoutes.cartRoute,
            );
          },
        ).badge(
            size: 20,
            color: Colors.redAccent,
            count: _cart.items.length,
            textStyle: TextStyle(color: context.accentColor)),
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
                CircularProgressIndicator(
                  color: Colors.deepPurple,
                ).centered().expand()
            ],
          ),
        ),
      ),
    );
  }
}
