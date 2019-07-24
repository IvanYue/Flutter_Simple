import 'package:fish_redux/fish_redux.dart';

class BaseState implements Cloneable<BaseState> {
  String avatar;
  String name;
  int age;

  BaseState();

  @override
  BaseState clone() {
    // TODO: implement clone
    return BaseState()
      ..avatar = avatar
      ..age = age
      ..name = name;
  }
}

BaseState initState(Map<String,dynamic>params){
  return BaseState();
}