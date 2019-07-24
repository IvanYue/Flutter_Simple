import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PageState> buildReducer() {
  return asReducer(
    <Object, Reducer<PageState>>{
      PageAction.updateBase:_onupdateBase, 
      PageAction.updateJob: _onupdateJob,
    },
  );
}

PageState _onupdateBase(PageState state, Action action) {
  print('Reducer:_onupdateBase');
  //获取Action
  final Map<String, dynamic> baseAction = action.payload ?? <String, String>{};
  final PageState newState = state.clone();
  newState.name = baseAction['name']??state.name;
  newState.avatar = baseAction['avatar']??state.avatar;
  newState.age = baseAction['age']??state.age;
  return newState;
}

PageState _onupdateJob(PageState state, Action action) {
  print('Reducer:_onupdateJob');
  //获取Action
  final Map<String, String> baseAction = action.payload ?? <String, String>{};
  final PageState newState = state.clone();
  newState.company = baseAction['company']??state.company;
  newState.job = baseAction['job']??state.job;
  newState.detail = baseAction['detail']??state.detail;
  return newState;
}
