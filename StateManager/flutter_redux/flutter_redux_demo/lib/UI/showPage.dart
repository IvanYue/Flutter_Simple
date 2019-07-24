
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_demo/Action/AppActions.dart';
import 'package:flutter_redux_demo/State/AppState.dart';

class ShowpageWidget extends StatelessWidget {
  const ShowpageWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      builder: (context,store){
        int count = store.state.countState.count;
        if (count ==null || count.isNaN) {
          store.dispatch(InitCount());
        } else {
        }
        return Center(
          child: Text(count.toString()),
        );
      },
    );
  
  }
}