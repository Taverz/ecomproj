


import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecomproj/data/model/database_clothes.dart';
import 'package:ecomproj/domain/failures/exception_api.dart';
import 'package:ecomproj/domain/failures/failure.dart';
import 'package:scoped_model/scoped_model.dart';





class ApiServiceDio {
  static String _apiey = "dsfdspo03240m2309";
  String _url = "http...";
  late Dio _dio;

  ApiServiceDio() {
    _dio = Dio();
  }

  Future<Either<Failure, List<ClothesModel>>> fetchNewsArticle() async {  //Future<Either<Failure, List<Model> >  >

    try{
      Response response = await _dio.get(_url);
      List<ClothesModel> apiResponse = [];
       apiResponse.add(ClothesModel.fromJson(response.data));
      return  Right(apiResponse);
    } on DioError catch (e) {
        print(e);
      return  Left(ServerFailure());
      // throw ServerException();
    }

  }

}