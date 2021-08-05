
import 'dart:async';


import 'package:flutter/material.dart';





class ListViewLoaded extends StatefulWidget {
  const ListViewLoaded({
    Key? key,
  }) : super(key: key);

  @override
  _PostsState createState() => _PostsState();
}



class _PostsState extends State<ListViewLoaded> {
  final scrollController = ScrollController();
  late PostsModel posts;
    int indexxxx = 0;

  @override
  void initState() {
    posts = PostsModel();

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent == scrollController.offset) {
        posts.loadMore();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: posts.stream,
      builder: (BuildContext _context, AsyncSnapshot _snapshot) {
        if(!_snapshot.hasData){
          return Center(child: CircularProgressIndicator());
        } else {
          return RefreshIndicator(
            onRefresh: posts.refresh,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              controller: scrollController,
              separatorBuilder: (context, index) => Divider(),
              itemCount: _snapshot.data.length + 1,
              itemBuilder: (BuildContext _context, int index) {
                if(index < _snapshot.data.length){
                  return ListViewModel(post: _snapshot.data[index]);
                } else if(posts.hasMore){
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 32.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 32.0),
                    child: Center(child: Text('nothing more to load!')),
                  );
                }
              },
            ),
          );
        }
      },
    );
  }
}



class ListViewModel extends StatelessWidget {
  final ItemModel post;


  const ListViewModel({
    Key? key,

    required this.post,
  })  : assert(post != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {



    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).dialogBackgroundColor,
          // border: Border.all(width: 2.0 ,color: Theme.of(context).dialogBackgroundColor,),
        ),
        child: 
        Column(children: [
          // Container(height: 70,width: 50, color: Colors.amber,),
          SizedBox(height: 15,),
          Text("data"),
          SizedBox(height: 15,),
        ],)
      ),
    );
 
  }


}


int lenghtL= 10;

Future<List<Map>> _getExampleServerData(int length) async {

    List<Map> mapL = [];
    mapL = List<Map>.generate(10, (int index) {
        return { 
        "Title":"Title",
        "Subscribe":"subscribe",
        "Price":index+30
        };
     }       
    );    

  return mapL;
}




class ItemModel {

  String title;

  String subscribe;
  String price;

  ItemModel({required this.subscribe,required  this.price,required this.title});
  factory ItemModel.fromServerMap(Map data) {
    return ItemModel(
      title: data['Title'],
      subscribe: data['Subscribe'],

      price: data['Price'],

    );
  }
}


class PostsModel {
  late Stream<List<ItemModel>> stream;
  late bool hasMore;

  late bool _isLoading;
  late List<Map> _data;
  late StreamController<List<Map>> _controller;

  PostsModel() {
    _data = <Map>[];
    _controller = StreamController<List<Map>>.broadcast();
    _isLoading = false;

    stream = _controller.stream.map((List<Map> postsData) {
      return postsData.map((Map postData) {
        return ItemModel.fromServerMap(postData);
      }).toList();
    });
    hasMore = true;
    refresh();
  }

  Future<void> refresh() {

    return loadMore(clearCachedData: true);
  }

  Future<void> loadMore({bool clearCachedData = false}) {
    if (clearCachedData) {
      _data = <Map>[];
      hasMore = true;
    }

    if (_isLoading || !hasMore) {
      return Future.value();
    }
    _isLoading = true;

    lenghtL +=10;

    return _getExampleServerData(lenghtL).then((postsData) {
      _isLoading = false;
      _data.addAll(postsData);
      hasMore = (_data.length < 500);
      _controller.add(_data);
    });
  }


}
