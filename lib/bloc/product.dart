

import 'package:ecomproj/data/database_moor/table/clothes.dart';
import 'package:ecomproj/domain/repository/repository.dart';
import 'package:ecomproj/domain/repository/repository_impl.dart';

/// содержимое, товары

//TODO:

// Api get
class ClothesBlock {

  RepositoryImpl repos;

  //   final _userGetter = PublishSubject<>();
  //   final _taskSubject = BehaviorSubject<List<>>();
  // Stream<> get getUser => _userGetter.stream;
  // Stream<List<>> get getTasks => _taskSubject.stream;


  ClothesBlock() : repos = RepositoryImpl();
  
  List<Clothes> getAllTrend(){
      return repos.allTrends();
  }

  List<Clothes>  getAllLiked(){
    return repos.allLiked();
  }

    List<Clothes> getAllTrendList({int? count,int? startList, int? endlist}){
      return repos.allTrends();
  }

  List<Clothes>  getAllLikedList({int? count,int? startList, int? endlist}){
    return repos.allLiked(count: count ?? 0, startList: startList ?? 0, endlist: endlist ?? 0 );
  }

  List<Clothes> getSerachClothes(String searchQuery){
    return repos.serach(searchQuery);
  }

  Clothes getDetailsClothes({int? id, String? name}){
      return repos.detailsClothes(id, name);
  }


  buyClothes(BuyDetails buyDetails){
    repos.buy(buyDetails);
  }





  dispose(){
    repos.close();
  }

}

// var dat = stream.listen((data) {
//          final newData = data.map((item) => item.data).toList();

//       _data = newData;

//       }) ;  