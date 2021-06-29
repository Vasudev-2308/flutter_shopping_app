import 'package:flutter/material.dart';
import 'package:shopping_app/models/items.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 3,
      
      child: ListTile(
        
        onTap: () {
          print(item.name);
        },
        leading: Image.network(item.image,fit: BoxFit.fill,),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: TextButton(
          child: Container(
              child: Text(
            "\$ ${item.price.toString()}",
            style: TextStyle(fontWeight: FontWeight.bold),
            textScaleFactor: 1.5,
          )),
          onPressed: () {},
        ),
      ),
    );
  }
}
