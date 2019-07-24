import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

// 界面实现
Widget buildView(FishReduxState state, Dispatch dispatch, ViewService viewService) {
  int _selectedIndex = 0;
  return Scaffold(
    appBar: AppBar(title: Text(state.title),),
    body: Center(
      child: Text(state.content),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        // 发送意图
        // dispatch(FishReduxActionCreator.update('say','hello,fish_redux'));

        //触发effect后发送
        dispatch(FishReduxActionCreator.onEditAction());
      },
      child: Icon(Icons.edit),
    ),
    bottomNavigationBar: BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.add),title: Text('加减')),
        BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle),title: Text('我的'))
      ],
      onTap: (index){

      },
    ),
  );
}
