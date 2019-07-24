import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:http/http.dart' as http;

void main() => runApp(CounterWidget());

class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Animation Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: MyFadeTest(title: 'Fade Demo'),
    );
  }
}

class MyFadeTest extends StatefulWidget {
  MyFadeTest({Key key, this.title}) : super(key: key);
  final String title;

  _MyFadeTestState createState() => _MyFadeTestState();
}

class _MyFadeTestState extends State<MyFadeTest> with TickerProviderStateMixin {
  List<Widget> widgets = [];
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    for (var i = 0; i < 100; i++) {
      widgets.add(getRow(i));
    }
  }

  // 不推荐这种，推荐使用ListView.builder
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(widget.title),
  //     ),
  //     // body: getBody()
  //     body: ListView(children: widgets,),
  //   );
  // }

  // Widget getRow(int i){
  //   return GestureDetector(
  //     child: Padding(
  //     padding: EdgeInsets.all(10),
  //     child: Text('Row $i'),
  //   ),
  //   onTap: (){
  //     setState(() {
  //       widgets = List.from(widgets);
  //       widgets.add(getRow(widgets.length+1));
  //       print('row $i');
  //     });
  //   },
  //   );
  // }

  //推荐使用 ListView.builder
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position) {
          return getRow(position);
        },
      ),
    );
  }

  Widget getRow(int position) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text('row row $position'),
      ),
      onTap: (){
        setState(() {
          widgets.add(getRow(widgets.length +1));
          print('row $position');
        });
      },
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  
}
