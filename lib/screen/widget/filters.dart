

// TODO() - нажата и не нажата кнопка фильтра
//
import 'package:ecomproj/app_config/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FiltersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
        Chip(label: Text('Size', style: Theme.of(context).textTheme.bodyText1), backgroundColor: backgroundColored, ),
    ],);
  }

} 