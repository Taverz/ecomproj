


import 'package:ecomproj/domain/api/api.dart';
import 'package:ecomproj/domain/api/network_info.dart';
import 'package:ecomproj/domain/entities/clothes_entity.dart';
import 'package:ecomproj/domain/entities/user_entity.dart';
import 'package:ecomproj/domain/repository/repository_impl.dart';


import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';


class MockRemoteDataAPI extends Mock
    implements RemoteDataAPI {}

class MockLocalDataSource extends Mock implements AppLocalData {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main(){

  RepositoryImpl repository;
  MockRemoteDataAPI mockRemoteData;
  MockLocalDataSource mockLocalData;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    
    mockRemoteData = MockRemoteDataAPI();
    mockLocalData = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = RepositoryImpl(
      networkInfo: mockNetworkInfo, 
      localData: mockLocalData, 
      remoteData: mockRemoteData, 
    );

  });




  test('Clothes entity test', () async {
    var user = ClothesEntity(
      id: 56, name: "name", 
      status: "status", description: "description", 
      type: "type", image: "image", color: ["color"], 
      size: ["size"], created:  DateTime.now()
    );

    ///ASSERT
    expect(user.id, 30);

  });



}