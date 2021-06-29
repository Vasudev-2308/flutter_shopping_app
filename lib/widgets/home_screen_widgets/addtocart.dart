import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/models/cart_model.dart';
import 'package:shopping_app/models/items.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catelog;
  final _cart = CartModel();
  AddToCart({Key? key, required this.catelog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(catelog)?true:false;
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
      onPressed: () {
        
        if(isInCart == false){
          isInCart = isInCart.toggle();
final _catelog = CatalogModel();

        _cart.catalog = _catelog;
        _cart.add(catelog);
        //setState(() {});
        }
        
      },
    );
  }
}