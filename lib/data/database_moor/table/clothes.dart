
import 'dart:convert';

import 'package:ecomproj/data/seialize/database_clothes.dart';
import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('Clothesobj')
class Clothes extends Table {

  IntColumn get id => integer()();
  TextColumn get size => text()();
  TextColumn get color => text()();
  IntColumn get price => integer()();
  TextColumn get nameClothes => text()();
  TextColumn get subscribe1 => text()();
  TextColumn get subscribe2 => text().nullable()();
  TextColumn get subscribe3 => text().nullable()();



  @override
  Set<Column> get primaryKey => {id};



}