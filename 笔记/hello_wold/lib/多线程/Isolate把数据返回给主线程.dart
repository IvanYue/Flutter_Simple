import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

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

    
    super.initState();
    lodaData();
  }
  // void loadData() async {
  //   String dataUrl = 'https://jsonplaceholder.typicode.com/posts';
  //   http.Response response = await http.get(dataUrl);
  //   setState(() {
  //     widgets = json.decode(response.body);
  //   });
  // }  

  showLoadingDialog(){
    if (widgets.length == 0) {
      return true;
    }
    return false;
  }

  getBody(){
    if (showLoadingDialog()) {
      return getProgressDialog();
    }
    return getListView();
  }

  getProgressDialog(){
    return Center(child: CircularProgressIndicator(),);
  }

  ListView getListView()=>ListView.builder(
    itemBuilder: (BuildContext context,int position){
      return getRow(position);
    },
    itemCount: widgets.length,
  );


  // Isolate 运行于自己独立执行线程上的Isolate
  // Isolate 不能共享内存。执行CPU密集型任务(解析庞大的json),密集型数学操作，加密或信号处理等。会阻塞UI刷新的任务

  // 把数据返回给主线程更新UI
 lodaData() async {
    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(dataLoader, receivePort.sendPort);

    SendPort sendPort = await receivePort.first;

    List msg = await sendReceive(sendPort,'https://jsonplaceholder.typicode.com/posts');
    setState(() {
      widgets = msg;
    });
  }

  static dataLoader(SendPort sendport) async{
    
    ReceivePort port  = ReceivePort();

    sendport.send(port.sendPort);

    await for (var msg in port) {
      String data= msg[0];
      SendPort replayTo = msg[1];

      String dataUrl = data;
      http.Response response = await http.get(dataUrl);

      replayTo.send(json.decode(response.body));
    }
  }

  Future sendReceive(SendPort port,msg){
    ReceivePort response = ReceivePort();
    port.send([msg,response.sendPort]);
    return response.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: getBody()
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


