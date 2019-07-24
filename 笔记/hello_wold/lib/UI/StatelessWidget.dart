import 'package:flutter/material.dart';
void main()=>runApp(MyApp('Hello World'));
/**
 * StatelessWidget 
 * StatelessWidget 没有 State
 * 生命周期 只有一个 build 函数
 */
// 继承 StatelessWidget
class MyApp extends StatelessWidget{

  final String content;
  MyApp(this.content);

  // 实现 build 函数，返回一个 Widget
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Text(content),
        ),
      )
    );
  }
  
}