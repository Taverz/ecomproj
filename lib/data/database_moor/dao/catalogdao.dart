

// import 'package:ecomproj/data/seialize/database_clothes.dart';

import '/data/database_moor/table/clothes.dart';
import '/data/database_moor/table/comment.dart';
import '/data/moor_database.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'catalogdao.g.dart';

@UseDao(tables: [Clothes, Comment])
class CatalogDao extends DatabaseAccessor<AppDatabase> with _$CatalogDaoMix{
  AppDatabase db;

  CatalogDao(this.db) :super(db);

  Future<List<Clothesobj>> getAllClothes() => select(clothes).get();
  Stream<List<Clothesobj>> getAllClothesW() => select(clothes).watch();

  Future insertNewOrder(Clothesobj clothesobj) => into(clothes).insert(clothesobj);


  Future deleteOrder(Clothesobj clothesobj) => delete(clothes).delete(clothesobj);
 

// Future<List<Clothes>> getSelect(int id) => select(clothes)

  Future ofdg(String name) => select(clothes).getSingle();

  Stream filteredNameClothes(String query) =>  customSelect(
          "SELECT COUNT(*) FROM clothes WHERE nameClothes = $query ",   // WHERE nameClothes = $query AND subscribe1 = $query
          readsFrom: {clothes} 
        ).watch();
              


}



class CatalogWith {
  final Clothes clothes;
  final Comment comment;

 CatalogWith(@required this.clothes, @required this.comment);
}