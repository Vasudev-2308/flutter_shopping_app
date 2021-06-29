import 'package:shopping_app/models/items.dart';

class CartModel {

  //Collection of Catalogfields
  CatalogModel _catalog = CatalogModel();
//Collection of ID's
  final List<int> _items = [];
  //get the Catelog
  // ignore: unnecessary_getters_setters
  CatalogModel get catalog => _catalog;

  // ignore: unnecessary_getters_setters
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  List<Item> get items => _items.map((id) => _catalog.getById(id)).toList();

  //get total price

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add Item
  void add(Item item) {
    _items.add(item.id);
  }

  void remove(Item item) {
    _items.remove(item.id);
  }
}
