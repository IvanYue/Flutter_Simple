import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:http/http.dart'as http;


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
  AnimationController animationController;
  CurvedAnimation curvedAnimation;

  List widgets = [];
  @override
  void initState() {
    // TODO: implement initState
    //
    const duration = Duration(milliseconds: 2000);
    animationController = AnimationController(duration: duration, vsync: this);
    curvedAnimation = CurvedAnimation(
        parent: animationController, curve: Cubic(0.42, 0.0, 1.0, 1.0));

    loadData();
    super.initState();
  }
  void loadData() async {
    String dataUrl = 'https://jsonplaceholder.typicode.com/posts';
    http.Response response = await http.get(dataUrl);
    setState(() {
      widgets = json.decode(response.body);
    });
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // body: Center(
      //   child: Container(
      //     child: FadeTransition(
      //       opacity: curvedAnimation,
      //       child: FlutterLogo(
      //         size: 100,
      //       ),
      //     ),
      //   ),
      // ),


      body: ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context,int postion){
          return getRow(postion);
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fade',
        child: Icon(Icons.brush),
        onPressed: () {
          animationController.forward();
        },
      ),
    );
  }
  Widget getRow(int i){
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text('Row ${widgets[i]['title']}'),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }
}


