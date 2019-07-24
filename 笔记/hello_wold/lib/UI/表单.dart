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
      home: MyCustomForm(title: '表单'),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  MyCustomForm({Key key, this.title}) : super(key: key);
  final String title;

  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> with TickerProviderStateMixin {

  final myController = TextEditingController();//创建一个文本控制器
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          return showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                content: Text(myController.text),//获取到表单的内容
              );
            }
          );
        },
        tooltip: 'Show me the Value',
        child: Icon(Icons.text_fields),
      ),
    );
  }

  
}

