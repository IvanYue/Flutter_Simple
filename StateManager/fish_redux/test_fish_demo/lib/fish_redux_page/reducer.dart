import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

// 接收意图，监听Action

Reducer<FishReduxState> buildReducer() {
  print('Reducer：buildRender');

  return asReducer<FishReduxState>(
    <Object, Reducer<FishReduxState>>{
      // 添加要监听的Action
      FishReduxAction.update: _update,
    },
  );
}

FishReduxState _update(FishReduxState state, Action action) {
  print('Render:_update');
  //获取Action
  final Map<String, String> update = action.payload ?? <String, String>{};
  final FishReduxState newState = state.clone();
  newState.title = update['title'] ?? newState.title;
  newState.content = update['content'] ?? newState.content;
  return newState;
}
