import 'package:dartz/dartz.dart';
import 'package:ecomproj/data/database_moor/table/clothes.dart';
import 'package:ecomproj/data/model/database_clothes.dart';
import 'package:ecomproj/domain/api/api.dart';
import 'package:ecomproj/domain/api/network_info.dart';
import 'package:ecomproj/domain/entities/clothes_entity.dart';
import 'package:ecomproj/domain/failures/exception_api.dart';
import 'package:ecomproj/domain/failures/failure.dart';
import 'package:meta/meta.dart';



abstract class Repository {
  
  @override Future<Either<Failure, List<ClothesEntity>>> getConcreteNumberData(int number);

  @override Future<Either<Failure, List<ClothesEntity>>> getAllTrendData();

  // @override  Future<Either<Failure, Clothes>> getAllData();

}

//TODO:

typedef  Future<List<ClothesEntity>> _Chooser();

class RepositoryImpl implements Repository{
  final RemoteDataAPI remoteData;
  final AppLocalData localData;
  final NetworkInfo networkInfo;
  

  RepositoryImpl({
    required this.remoteData,
    required this.localData,
    required this.networkInfo
  });


@override
  Future<Either<Failure, List<ClothesEntity>>> getConcreteNumberData(
    int number,
  ) async {
    return await _getData(() {
      return remoteData.getConcreteNumberClothes(number);
    });
  }

 @override
  Future<Either<Failure, List<ClothesEntity>>> getAllTrendData() async {
    return await _getData(() {
      return  remoteData.getTrand();
    });
  }

//  @override
//   Future<Either<Failure, ClothesEntity>> getAllData() async {
//     return await _getData(() {
//       return remoteData.getTrand();
//     });
//   }


  Future<Either<Failure, List<ClothesEntity>>> _getData(
        _Chooser getCincretOrRandom
  ) async {

    if(await networkInfo.isConnected) {
      try{
        final remote =  await getCincretOrRandom();
        localData.cacheShared(remote as ClothesModel);
        return Right(remote);
      } on ServerException{
        return Left(ServerFailure());
      }
    } else{
       try{
        final local = await localData.getSharedCache() ;
        return Right(local);
      } on Exception{
        return Left(ServerFailure());
      }
    }

  }




}