import 'package:flutter/material.dart';
import 'package:shopping_app/models/items.dart';
import 'package:shopping_app/screens/details.dart';
import 'package:shopping_app/widgets/home_screen_widgets/listitem.dart';


class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalogitem = CatalogModel.items[index];
        return InkWell(
          onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(catalog: catalogitem))),
          child: CatalogItem(catalogItem: catalogitem));
      },
    );
  }
}