import 'package:flutter_redux_demo/Action/AppActions.dart';
import 'package:flutter_redux_demo/State/AppState.dart';

AppState appReducer(AppState state, Object action) => AppState(
  

  countReducer(state, action),
);


CountState countReducer(AppState state,Object action){
  if (action is ChangeCountAction) {
    return CountState(action.count);
  } 
  return state.countState;
}