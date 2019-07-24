import 'package:flutter/material.dart';
import 'package:hello_wold/UI/RichText-%E5%AF%8C%E6%96%87%E6%9C%AC.dart';
import 'package:hello_wold/UI/StatefulWidget.dart';




/**
 * Flutter布局Widget —— 线性布局
 *     - Row：水平方向的线性布局
 *     - Column：垂直方向的线性布局
 *     - Row 和 Column 都继承自弹性布局 Flex，
 *       其实就是确定了主轴方向的 Flex，其余的用法和 Flex 一致。
 * 
 *     - 如果 Row 里面嵌套 Row，或者 Column 里面再嵌套 Column，
 *       那么只有最外面的 Row 或 Column 会占用尽可能大的空间，
 *       里面 Row 或 Column 所占用的空间为实际大小。
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
        body:Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Hello Flutter -- row'),
                Image.network('https://img2018.cnblogs.com/blog/1115039/201906/1115039-20190626105628407-127759332.png',
                              width: 200,
                              height: 200)
              ],
            ),
            Column(
              children: <Widget>[
                Text('Hello Flutter -- row'),
                Image.network('https://img2018.cnblogs.com/blog/1115039/201906/1115039-20190626105628407-127759332.png',
                              width: 200,
                              height: 200)
              ],
              
            )
          ],
        ) 
      ),
    );
  }

 
}


