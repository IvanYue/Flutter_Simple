import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'BaseState.dart';

Widget buildView(BaseState state, Dispatch dispatch, ViewService viewService) {
  return Card(
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
                Text(state.age == null ? '' : state.age.toString())
              ],
            ),
          )
        ],
      ),
    ),
  );
}
