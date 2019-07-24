import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<NoComponentMineState> buildReducer() {
  return asReducer(
    <Object, Reducer<NoComponentMineState>>{
      NoComponentMineAction.updateBase:_onupdateBase, 
      NoComponentMineAction.updateJob: _onupdateJob,
    },
  );
}

NoComponentMineState _onupdateBase(NoComponentMineState state, Action action) {
  print('Reducer:_onupdateBase');
  //获取Action
  final Map<String, dynamic> baseAction = action.payload ?? <String, String>{};
  final NoComponentMineState newState = state.clone();
  newState.name = baseAction['name']??state.name;
  newState.avatar = baseAction['avatar']??state.avatar;
  newState.age = baseAction['age']??state.age;
  return newState;
}

NoComponentMineState _onupdateJob(NoComponentMineState state, Action action) {
  print('Reducer:_onupdateJob');
  //获取Action
  final Map<String, String> baseAction = action.payload ?? <String, String>{};
  final NoComponentMineState newState = state.clone();
  newState.company = baseAction['company']??state.company;
  newState.job = baseAction['job']??state.job;
  newState.detail = baseAction['detail']??state.detail;
  return newState;
}
