import 'package:flutter/material.dart';
import 'package:hello_wold/UI/RichText-%E5%AF%8C%E6%96%87%E6%9C%AC.dart';
import 'package:hello_wold/UI/StatefulWidget.dart';




/**
 * Flutter 布局 Widget —— 层叠布局  Stack
 *     Stack：是层叠布局，其 子Widget 会按照添加顺序确定显示层级，
 *            后面添加的会覆盖在前面添加的 Widget 上面
 *     Stack 的 子Widget:
 *        - positioned 子Widget:被 Positioned 嵌套起来的 Widget，
 *           Positioned 可以控制 子Widget 到父容器四个边的距离
 * 
 *        - non-positioned 子Widget:non-positioned子Widget 就是不用 Positioned 
 *           嵌套起来的 Widget,non-positioned子Widget 
 *            使用 Stack 设置的 alignment 来确定自己在父容器里的位置。
 *        
 */         


void main()=> runApp( new FlexWidget());

class FlexWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Test',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter 布局 Widget'),
        ),
        body:Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              left: 50,
              top: 50,
              child: Image.network('https://img2018.cnblogs.com/blog/1115039/201906/1115039-20190626111222523-1540922247.png',
              width: 300,fit: BoxFit.cover,
            )
            ),
            Text('层叠布局')
          ]
        )
      ),
    );
  }

 
}


