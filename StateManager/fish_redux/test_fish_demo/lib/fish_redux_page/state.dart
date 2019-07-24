import 'package:fish_redux/fish_redux.dart';

// 创建页面状态类，包含标题和内容数据，状态类必须实现Cloneable接口
class FishReduxState implements Cloneable<FishReduxState> {

  String title;
  String content;
  FishReduxState({this.title,this.content});


  @override
  FishReduxState clone() {
    return FishReduxState()
      ..title = title 
      ..content = content;
  }
}
// 页面初始化
FishReduxState initState(Map<String, dynamic> args) {
  print('state:initState');
  return FishReduxState(title: 'title',content: 'content');
}


void example(){
  // 串联符号..
// querySelector('#button') // Get an object.
//   ..text = 'Confirm'   // Use its members.
//   ..classes.add('important')
//   ..onClick.listen((e) => window.alert('Confirmed!'));

// 等价于

// var button = querySelector('#button');
// button.text = 'Confirm';
// button.classes.add('important');
// button.onClick.listen((e) => window.alert('Confirmed!'));



}