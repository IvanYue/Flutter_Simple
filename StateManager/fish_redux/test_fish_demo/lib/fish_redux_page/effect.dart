import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<FishReduxState> buildEffect() {
  return combineEffects(<Object, Effect<FishReduxState>>{
    Lifecycle.initState:_init,
    FishReduxAction.onEdit: _onEditAction,
  });
}
void _init(Action action,Context<FishReduxState>ctx){
  //数据初始化
  print('Effect:_init');
  ctx.dispatch(FishReduxActionCreator.updateAction('title','init'));
}

String _input;

void _onEditAction(Action action, Context<FishReduxState> ctx) {
  //监听onEdit方法
  print('Effect:_onEditAction');
  
  showDialog(
    context: ctx.context,
    builder: (_)=> new AlertDialog(
      title: Text('Modify content'),
      content: TextField(
        onChanged: (String text){
          _input=text;
        },
      ),
      actions: <Widget>[
        new FlatButton(
          child:  new Text('Cancel'),onPressed: (){
             Navigator.of(ctx.context).pop();
          },
        ),
        new  FlatButton(
          child:   Text('Ok'),
          onPressed: (){
             Navigator.of(ctx.context).pop(_input);
          },
        )
      ],
    )
  ).then((_){
    ctx.dispatch(FishReduxActionCreator.updateAction('title', _input));
  });
}
