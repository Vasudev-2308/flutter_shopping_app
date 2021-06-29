import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/models/cart_model.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cartmodel = CartModel();
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$ ${_cartmodel.totalPrice}"
              .text
              .xl4
              .color(context.accentColor)
              .make(),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Container(
                            height: 50,
                            child:
                                "Buying Not Supported Currently".text.make())));
                  },
                  child: "Buy".text.white.make(),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(context.theme.buttonColor),
                      shape: MaterialStateProperty.all(StadiumBorder())))
              .wh(100, 50)
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
    final _cartmodel = CartModel();
    CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _cartmodel.items.isEmpty
        ? Center(child: "Nothing to Show".text.xl3.make())
        : ListView.builder(
            itemCount: _cartmodel.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(
                  Icons.done,
                  color: Colors.green,
                ),
                title: _cartmodel.items[index].name.text.make(),
                trailing: IconButton(
                  icon: Icon(
                    CupertinoIcons.minus_circle,
                    color: context.accentColor,
                  ),
                  onPressed: () {
                    _cartmodel.remove(_cartmodel.items[index]);
                    
                  },
                ),
              );
            },
          );
  }
}
