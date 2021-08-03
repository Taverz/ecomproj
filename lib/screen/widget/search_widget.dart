

// TODO() - Фиджет поиска

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchandFilter extends StatelessWidget{

bool _isVisible= true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children:[ Row(children: [
          Spacer(),
            Container(
              // decoration: ,
              height: 30 ,
              width: MediaQuery.of(context).size.width / 3,
            ),
            Spacer(),
            IconButton(onPressed: (){

            }, icon: Icon(Icons.filter_list_outlined))
        ],),
        Visibility(visible: _isVisible, child: Wrap(children: [],))
        ]
      ) ,
    );
  }




}