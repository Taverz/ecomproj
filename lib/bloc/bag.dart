import 'package:flutter/material.dart';

class BagCacheBlock extends ChangeNotifier {
  
  bool _isLoading = true;

  List<Item> _item = [];
  bool get loading => _isLoading;
  List<Item> get items => _item;

  get totalPrice =>
      items.fold(0, (int total, current) => total + current.price);

  set add(Item item) {
    _item.add(item);
    notifyListeners();
  }

  void delite(Item item) {
    _item.remove(item);
    notifyListeners();
  }

  loaded(){
     Future.delayed(Duration(seconds: 4) ).then((value)
        {
          _isLoading= false;
           notifyListeners();
        }

      );

  }

}

@immutable
class Item {
  final int id;
  final String name;
  final Color color;
  final int price = 42;

  Item(this.id, this.name)
      // To make the sample app look nicer, each item is given one of the
      // Material Design primary colors.
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
