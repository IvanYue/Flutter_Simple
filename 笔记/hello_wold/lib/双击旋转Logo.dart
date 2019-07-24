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

AnimationController animationController;
CurvedAnimation curvedAnimation;


  @override
  void initState() {
    // TODO: implement initState
  animationController = AnimationController(duration: const Duration(milliseconds: 2000),vsync: this);
  curvedAnimation = CurvedAnimation(parent: animationController,curve: Cubic(0.42, 0.0, 1.0, 1.0));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: GestureDetector(
          child: RotationTransition(
            turns: curvedAnimation,
            child: FlutterLogo(size: 200,),
          ),
          onDoubleTap: (){
            // 双击旋转动画
            if (animationController.isCompleted) {
              animationController.reverse();
            } else {
              animationController.forward();
            }
          },
        ),
      )
    );
  }

  
}
