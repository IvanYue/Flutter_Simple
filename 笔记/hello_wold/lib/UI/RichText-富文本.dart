import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
void main()=>runApp(MyApp());
/**
 * StatelessWidget 
 * StatelessWidget 没有 State
 * 生命周期 只有一个 build 函数
 */
// 继承 StatelessWidget
class MyApp extends StatelessWidget{


  

  // 实现 build 函数，返回一个 Widget
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      // Scaffold 是MateriaApp的顶级容器，会自动适配屏幕
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter UI基础Widget -- 富文本'),),
        // body 要显示UI
        body: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'Hello',
              style: TextStyle(color: Colors.blue),
              // recognizer: 一个手势识别器，它将接收到达此文本范围的事件。
              ),

            TextSpan(text: "world!",style: TextStyle(color: Colors.red))
          ]),
        ),
      )
      
    );
  }
  
}