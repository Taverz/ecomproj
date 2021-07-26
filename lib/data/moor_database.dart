
import 'package:ecomproj/data/database_moor/dao/catalogdao.dart';
import 'package:ecomproj/data/database_moor/table/clothes.dart';
import 'package:ecomproj/data/database_moor/table/comment.dart';

import 'package:moor_flutter/moor_flutter.dart';


part 'moor_database.g.dart';

@UseMoor(tables: [Clothes, Comment], daos: [CatalogDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
          : super((FlutterQueryExecutor.inDatabaseFolder(
            path: 'db2.sqlite',
            logStatements: true,
            )));

  @override
  int get schemaVersion => 1;

}

