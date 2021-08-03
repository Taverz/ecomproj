
import 'package:ecomproj/data/database_moor/dao/catalogdao.dart';
import 'package:ecomproj/data/moor_database.dart';

final DatabaseLocalBloc dataBloc = DatabaseLocalBloc();

class DatabaseLocalBloc {

  final AppDatabase db;
  late CatalogDao dao;

  DatabaseLocalBloc(): db = AppDatabase() { dao = db.catalogDao; }

   void close() {
    db.close();
  }

}