import 'package:flutter/material.dart';
import 'package:shopping_app/models/items.dart';
import 'package:shopping_app/widgets/home_screen_widgets/addtocart.dart';
import 'package:shopping_app/widgets/home_screen_widgets/objectImage.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogItem extends StatelessWidget {
  final Item catalogItem;

  const CatalogItem({Key? key, required this.catalogItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalogItem.id.toString()),
          child: CatalogImage(
            image: catalogItem.image,
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalogItem.name.text.bold.color(context.accentColor).make(),
            catalogItem.desc.text.normal.make(),
            ButtonBar(
              buttonPadding: Vx.mOnly(right: 20),
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$ ${catalogItem.price}".text.bold.xl.make(),
                AddToCart(
                  catelog: catalogItem,
                )
              ],
            )
          ],
        ))
      ],
    )).color(context.cardColor).rounded.square(150).make().py16();
  }
}


