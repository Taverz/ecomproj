


import 'package:ecomproj/domain/entities/clothes_entity.dart';
import 'package:ecomproj/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('User entity test', () async {
    var user = UserEntity(id:12, name:"lot", image: '', subscribe: '' );

    ///ASSERT
    expect(user.id, 30);

  });
}