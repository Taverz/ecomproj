

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecomproj/domain/failures/exception_api.dart';
import 'package:ecomproj/domain/failures/failure.dart';
import 'package:scoped_model/scoped_model.dart';



class ApiProvider {

}




class ApiServiceDio {
  static String _apiey = "dsfdspo03240m2309";
  String _url = "http...";
  late Dio _dio;

  ApiServiceDio() {
    _dio = Dio();
  }

  Future<Either<Failure, List<Model>>> fetchNewsArticle() async {  //Future<Either<Failure, List<Model> >  >

    try{
      Response response = await _dio.get(_url);
      Convert apiResponse = Convert.fromJson(response.data);
      return apiResponse.article;
    } on DioError catch (e) {
        print(e);
      throw ServerException();
    }

  }

}