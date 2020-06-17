import 'package:flutter/foundation.dart';
import 'package:solyric_app/domain/model/RecordAudio.dart';

class CartModel extends ChangeNotifier {
  /// The private field backing [recordList].
  RecordAudio _recordList;

  /// Internal, private state of the cart. Stores the ids of each item.
  final List<int> _itemIds = [];

  /// The current catalog. Used to construct items from numeric ids.
  RecordAudio get recordList => _recordList;

  /*set catalog(RecordAudio newCatalog) {
    assert(newCatalog != null);
    assert(_itemIds.every((id) => newCatalog.getById(id) != null),
        'The catalog $newCatalog does not have one of $_itemIds in it.');
    _catalog = newCatalog;
    // Notify listeners, in case the new catalog provides information
    // different from the previous one. For example, availability of an item
    // might have changed.
    notifyListeners();
  }*/

  /// List of items in the cart.
 // List<RecordAudio> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  /// The current total price of all items.
  /*int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);*/

  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(RecordAudio item) {
    _itemIds.add(item.id);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }
}