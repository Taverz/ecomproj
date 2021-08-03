

import 'package:ecomproj/domain/repository/repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBlock {
  User user;

  UserLogIn(this.user);

  Future<String> userRegister(User user) async{
     var result = repository.register(user);
     if(result==null) {
        return "Such user already exists";
     } else{
       SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('login', user);
        return "success";
     }
  }

  Future<String?> get login async {
     SharedPreferences pref = await SharedPreferences.getInstance();
      String? sh = pref.getString('login');
      return sh;
  }

  Future logiIn(User user) async{
      if(repository.login(user)){
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('login', user);
        return true;
      }else{
        return false;
      }
  }


 

}