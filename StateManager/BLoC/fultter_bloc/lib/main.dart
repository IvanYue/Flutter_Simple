import 'package:flutter/material.dart';
import 'package:fultter_bloc/bloc/bloc_provice.dart';
import 'package:fultter_bloc/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // home: MyHomePage(title: 'Flutter Demo Home Page'),
          home: HomeWidget()),
    );
  }
}
