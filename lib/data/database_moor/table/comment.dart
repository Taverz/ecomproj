
import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('Commentobj')
class Comment extends Table {

  TextColumn get author  => text()();
  IntColumn get id => integer()();
  DateTimeColumn get data => dateTime().nullable()();
  TextColumn get nameClothes => text()(); 

  
  @override
  Set<Column> get primaryKey => {id};

 
}