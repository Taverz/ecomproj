import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecomproj/data/database_moor/dao/catalogdao.dart';
import 'package:ecomproj/data/model/database_clothes.dart';
import 'package:ecomproj/data/moor_database.dart';
import 'package:ecomproj/domain/failures/exception_api.dart';
import 'package:ecomproj/domain/failures/failure.dart';
import 'package:http/http.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

//TODO:

abstract class DataInterface {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<ClothesModel>> getConcreteNumberClothes(int number);

  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<ClothesModel>> getTrand();
}

class AppLocalData implements DataInterface {
 final AppDatabase db;
  late CatalogDao _dao;
  final SharedPreferences sharedPreferences;
  AppLocalData({
    required this.db,
    required this.sharedPreferences,
  }) {
    _dao = CatalogDao(db);
  }

  @override
  Future<List<ClothesModel>> getConcreteNumberClothes(int number) async {
    // CatalogDao dao = db.catalogDao;

    final data = await _dao.getAllClothes();
    db.close();
    final models =
        (data as List).map((modle) => ClothesModel.fromJson(modle)).toList();
    return models;
  }

  @override
  Future<List<ClothesModel>> getTrand() async {
    // CatalogDao dao = db.catalogDao;

    final data = _dao.getAllClothes();
    db.close();
    final models =
        (data as List).map((modle) => ClothesModel.fromJson(modle)).toList();
    return models;
  }

  String _CACHED_NUMBER_TRIVIA = "cahedlocal";

  @override
  Future<List<ClothesModel>> getSharedCache() async {
    final jsonString = sharedPreferences.getStringList(_CACHED_NUMBER_TRIVIA);
    if (jsonString != null) {
      List<ClothesModel> listM = [];
      for (var ver in jsonString) {
        listM.add(ClothesModel.fromJson(json.decode(ver)));
      }
      return listM;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<bool> cacheShared(ClothesModel triviaToCache) {
    return sharedPreferences.setString(
      _CACHED_NUMBER_TRIVIA,
      json.encode(triviaToCache.toJson()),
    );
  }
}

class RemoteDataAPI implements DataInterface {
  final  String urlTrand = 'http://numbersapi.com/trand';

  Client clent;

  RemoteDataAPI({required this.clent});

  @override
  Future<List<ClothesModel>> getTrand() => _getFromUrl(urlTrand);

  @override
  Future<List<ClothesModel>> getConcreteNumberClothes(int number) =>
      _getFromUrl('http://numbersapi.com/$number');

  Future<List<ClothesModel>> _getFromUrl(String url) async {
    final  urlP = Uri.parse(url);
    final response = await clent.get(
      urlP,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final personsR = json.decode(response.body);
      return (personsR['results'] as List)
          .map((respon) => ClothesModel.fromJson(respon))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
