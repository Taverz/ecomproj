


import 'package:dio/dio.dart';
import 'package:ecomproj/domain/api/api.dart';


class Repository {
  final apiProvider = ApiProvider();

  Future<User> registerUser(String username, String firstname, String lastname, String nikname, String password, String email)
                  => apiProvider.registerUser(username, firstname, lastname, nikname, password, email);

    Future signinUser(String username, String password, String apiKey) 
          => apiProvider.signinUser(username, password, apiKey);        

  Future getAllCatalog(String typeCatalog)
            => apiProvider.                    
}



