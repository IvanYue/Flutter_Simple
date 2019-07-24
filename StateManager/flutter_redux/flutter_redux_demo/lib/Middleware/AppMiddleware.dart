import 'dart:io';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_demo/Action/AppActions.dart';
import 'package:flutter_redux_demo/State/AppState.dart';
import 'package:redux/redux.dart';

void appMiddleware(
    Store<AppState> store, Object action, NextDispatcher next) async {
  
  if (action is InitCount) {
    initCount(store);
  } else if(action is CountAddAction){
    
      addCount(store,action);
  }else if(action is CountRemoveAction){
    
      subtractCount(store, action);
  }
  next(action);
}

void initCount(Store<AppState> store) async{
  
  //处理初始值
  store.dispatch(ChangeCountAction(0));
}

void addCount(Store<AppState> store,CountAddAction action){

  int count = action.count +1;
  store.dispatch(ChangeCountAction(count));
}


void subtractCount(Store<AppState> store,CountRemoveAction action){
  int count = action.count -1;
  store.dispatch(ChangeCountAction(count));
 
}