import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:test_fish_demo/NoComponentMine_page/page.dart';
// import 'package:test_fish_demo/fish_redux_page/page.dart';



void main() => runApp(SimpleDemo());

class SimpleDemo extends StatelessWidget {
  const SimpleDemo({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final AbstractRoutes routes = PageRoutes(
      pages: <String,Page<Object,dynamic>>{
        // 'main':FishReduxPage(),
        // 'maineffect':FishReduxPage(),
        'min_NoComponent':NoComponentMinePage()
      }
    );

    return MaterialApp(
      title: 'simple',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: routes.buildPage('min_NoComponent', null),
    );
  }
}