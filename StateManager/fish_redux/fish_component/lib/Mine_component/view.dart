import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import 'state.dart';

Widget buildView(
    PageState state, Dispatch dispatch, ViewService viewService) {
      // return viewService.buildComponent('base');
  return Scaffold(
      appBar: AppBar(
        title: Text('个人信息'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          viewService.buildComponent('base'),
          viewService.buildComponent('job')
        ],
      )
      
      );
}
