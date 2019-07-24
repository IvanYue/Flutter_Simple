import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:test_fish_demo/NoComponentMine_page/MyExpand.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    NoComponentMineState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
      appBar: AppBar(
        title: Text('个人信息'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  FadeInImage.assetNetwork(
                    placeholder: 'images/timg.jpg',
                    image: state.avatar ?? '',
                    height: 60,
                    width: 60,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(state.name ?? ''),
                        Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(state.age == null
                                    ? ''
                                    : state.age.toString())
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: MyExpand(<Widget>[
                  Text('公司:${state.company}'),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('职位：${state.job}'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('详情:${state.detail}'),
                  )
                ]),
              )),
        ],
      ),floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          dispatch(NoComponentMineActionCreator.onRefreshAction());
        },
      ),
      
      );
}
