import 'package:flutter/material.dart';
// import 'package:hello_wold/dart%E8%AF%AD%E6%B3%95.dart';

void main()=>runApp(MyApp("Hello World"));


class MyApp extends StatefulWidget{

  String content;
  MyApp(this.content);
  // StatefulWidget 主要功能就是创建 State
  @override
  //继承 StatefulWidget ，实现 createState 
  State<StatefulWidget> createState() {
    // 返回一个State
    return MyAppState();
  } 
}
// 首先继承State，State的泛型类型是上面定义的Widget的类型
/**
 * 1.build -- 创建Widget 用于显示UI
 * 2.setState - 刷新UI，更新状态
 */
class MyAppState extends State<MyApp>{

  bool isShowText = true;

  void increment(){
    // 防止 setState() 抛出异常
    if (mounted) {
        // 需要更改数据，刷新UI，调用setState
      setState(() {
      // 修改数据的值，会触发State的build方法，硬气强制重建WIdget
      // 重建Widget的时候会重新绑定数据，而这时数据已经变化，从而达到刷新UI的目的
      widget.content += 'd';
      });
    }
  }

  @override
  //实现Build 返回一个Widget   
  // BuildContext 是 Flutter 里的重要概念。
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Widget -- StatefulWidget及State"),),
        body: Center(
          child: GestureDetector(
            // widget 可以访问StatefulWidget中的成员变量
              child:isShowText?Text(widget.content):null,
              onTap: increment,
          )
        ),
      ),
    );
  }

}