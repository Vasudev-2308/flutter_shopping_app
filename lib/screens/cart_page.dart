import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/core/store.dart';
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
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            builder: (context, store, _) {
              return "\$ ${_cart.totalPrice}"
                  .text
                  .xl4
                  .color(context.accentColor)
                  .make();
            },
            mutations: {RemoveMutation},
            notifications: {},
          ),
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
  CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? Center(child: "Nothing to Show".text.xl2.make())
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(
                  Icons.done,
                  color: Colors.green,
                ),
                title: _cart.items[index].name.text.make(),
                trailing: IconButton(
                  icon: Icon(
                    CupertinoIcons.minus_circle,
                    color: context.accentColor,
                  ),
                  onPressed: () {
                    RemoveMutation(_cart.items[index]);
                  },
                ),
              );
            },
          );
  }
}
