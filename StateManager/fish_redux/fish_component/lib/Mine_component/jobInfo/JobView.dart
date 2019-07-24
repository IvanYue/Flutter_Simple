import 'package:fish_component/Mine_component/jobInfo/JobState.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import '../MyExpand.dart';

Widget buildView(
  JobState state,Dispatch dispatch, ViewService viewService
) {
  return Card(
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
      ));
}
