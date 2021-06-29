import 'package:shopping_app/models/cart_model.dart';
import 'package:shopping_app/models/items.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatalogModel catalog = CatalogModel();
  CartModel cart = CartModel();

  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
