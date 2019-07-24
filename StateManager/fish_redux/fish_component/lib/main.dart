import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'Mine_component/page.dart';

void main() => runApp(SimpleDemo());

class SimpleDemo extends StatelessWidget {
  const SimpleDemo({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final AbstractRoutes routes = PageRoutes(
      pages: <String,Page<Object,dynamic>>{
        'main':InfoPage(),
      }
    );

    return MaterialApp(
      title: 'simple',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: routes.buildPage('main', null),
    );
  }
}