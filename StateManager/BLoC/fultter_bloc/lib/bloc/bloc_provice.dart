import 'package:flutter/material.dart';
import 'countBloc.dart';

class  BlocProvider extends InheritedWidget {

  CounterBLoc bLoC = CounterBLoc();

  BlocProvider({Key key, this.child}) : super(key: key, child: child);

  final Widget child;

  static  CounterBLoc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(BlocProvider)as  BlocProvider).bLoC;
  }

  @override
  bool updateShouldNotify(  BlocProvider oldWidget) {
    return true;
  }
}