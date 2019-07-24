/**
 * 
 * Flutter 使用三级视图树来渲染，就是为了提升渲染的性能。
 *     - Widget
 *       Widget 只含有配置信息，不负责渲染，非常轻量，因此可以大量频繁的创建。
 *     - Element 
 *       Element 负责 diff，只更新变化的部分。  
 *     - RenderObject
 *       RenderObject 负责渲染。
 * 
 */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter渲染 -- Widget，Element，RenderObject'),),
        body: Column(
          children: <Widget>[
            RaisedButton(onPressed: (){},child: Text("Button") ,),
            Text('Hello Flutter')
          ],
        ),
      ),
    );
  }
}