import 'package:fish_redux/fish_redux.dart';

class NoComponentMineState implements Cloneable<NoComponentMineState> {


  String avatar;
  String name;
  int age;

  String company;
  String job;
  String detail;

  NoComponentMineState();

  @override
  NoComponentMineState clone() {
    return NoComponentMineState()
    ..name=name
    ..avatar=avatar
    ..age=age
    ..company=company
    ..job=job
    ..detail=detail;
  }
}

NoComponentMineState initState(Map<String, dynamic> args) {
  return NoComponentMineState();
}
