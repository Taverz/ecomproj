
import 'package:flutter/material.dart';

class BlockBag extends ChangeNotifier {

  List<Item> _item = [];

  List<Item> get items => _item;

  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item){
    _item.add(item);

    notifyListeners();
  }

  void remove(Item item){
    _item.remove(item);

      notifyListeners();
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