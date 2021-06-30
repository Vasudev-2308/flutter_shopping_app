import 'package:shopping_app/core/store.dart';
import 'package:shopping_app/models/items.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //Collection of Catalogfields
  CatalogModel _catalog = CatalogModel();
//Collection of ID's
  final List<int> _itemIds = [];
  //get the Catelog
  // ignore: unnecessary_getters_setters
  CatalogModel get catalog => _catalog;

  // ignore: unnecessary_getters_setters
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get total price

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add Item

}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}
