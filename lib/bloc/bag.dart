


import 'package:flutter/material.dart';

class BagCacheBlock 
extends ChangeNotifier
 {

   final  bool _isLoading = true;
    // BagCacheBlock(){
    //   Future.delayed(Duration(seconds: 3) ).then((value) 
    //     {
    //       _isLoading= false;
    //       //  notifyListeners();
    //     }
          
    //   );
    // }
  final List<Item> _item = [];
   bool get loading => _isLoading;
  List<Item> get items => _item;

   get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  set add(Item item){
    _item.add(item);
 
  }

   loaded(){
     Future.delayed(Duration(seconds: 4) ).then((value) 
        {
          _isLoading= false;
           notifyListeners();
        }
          
      );
 
  }

  void remove(Item item){
    _item.remove(item);

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