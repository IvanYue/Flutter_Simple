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
      home: MyFadeTest(title: 'List Demo'),
    );
  }
}

class MyFadeTest extends StatefulWidget {
  MyFadeTest({Key key, this.title}) : super(key: key);
  final String title;

  _MyFadeTestState createState() => _MyFadeTestState();
}

class _MyFadeTestState extends State<MyFadeTest> with TickerProviderStateMixin {
  List widgets = [];
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    loadData();
  }

  void loadData() async {
    String dataUrl = 'https://jsonplaceholder.typicode.com/posts';
    http.Response response = await http.get(dataUrl);
    setState(() {
      widgets = json.decode(response.body);
    });
  }

  showLoadingDialog() {
    return widgets.length == 0;
  }

  getProgressDialog() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // body: getBody()
      body: ListView(
        children: _getListData(),
      ),
    );
  }
  
  _getListData() {
    List<Widget> widgets = [];
    for (var i = 0; i < 100; i++) {
      widgets.add(GestureDetector(
        child: Container(
          color: Colors.red,
          child: Text('100'),
        ),
        onTap: () {
          print('tap $i');
        },
      ));
    }
    return widgets;
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    }
    return getListView();
  }

  ListView getListView() => ListView.builder(
        itemBuilder: (BuildContext context, int position) {
          return getRow(position);
        },
        itemCount: widgets.length,
      );

  Widget getRow(int i) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text('Row ${widgets[i]['title']}'),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
