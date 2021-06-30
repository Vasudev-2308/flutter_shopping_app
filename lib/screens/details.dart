import 'package:flutter/material.dart';
import 'package:shopping_app/models/items.dart';
import 'package:shopping_app/widgets/home_screen_widgets/addtocart.dart';
import 'package:velocity_x/velocity_x.dart';

class Details extends StatelessWidget {
  final Item catalog;
  const Details({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          buttonPadding: Vx.mOnly(right: 20),
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$ ${catalog.price}".text.bold.xl3.make(),
            AddToCart(catelog: catalog).wh(150, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h40(context),
            Expanded(
                child: VxArc(
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              height: 20,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      catalog.name.text.xl3
                          .color(context.accentColor)
                          .bold
                          .make(),
                      catalog.desc.text.xl.color(context.accentColor).make(),
                      "Labore ea dolore lorem sea et sit invidunt diam, dolore lorem ipsum eos eos tempor et gubergren takimata voluptua. Sea takimata sea ipsum rebum sed voluptua consetetur, lorem sea amet clita consetetur consetetur tempor. Tempor lorem dolores invidunt accusam magna ipsum tempor."
                          .text
                          .make()
                          .p16()
                    ],
                  ).py64(),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
