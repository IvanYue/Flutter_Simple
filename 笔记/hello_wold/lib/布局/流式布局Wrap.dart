import 'package:flutter/material.dart';
import 'package:hello_wold/UI/RichText-%E5%AF%8C%E6%96%87%E6%9C%AC.dart';
import 'package:hello_wold/UI/StatefulWidget.dart';




/**
 * Flutter 布局 Widget —— 流式布局:主要用于代替 ROW
 *     流式布局：页面元素的宽度可以按照屏幕分辨率进行适配调整，但整体布局不变。
 *            - 在 Flex、Row、Column 中，
 *              当 子Widget 的大小超过 主轴的大小后，
 *              就会报 layout 的 overflowed 错误 ，会在界面上看到黄黑色的条。
 *            - Wrap 会把超出屏幕显示范围的 Widget 自动换行，所以称为流式布局。
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
        body:Wrap(
          direction: Axis.horizontal,
          spacing: 8.0,// 主轴 方向间距
          runSpacing: 12.0 ,// 交叉轴  方向间距
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.start,
          children: <Widget>[
            // Row(
            //   children: <Widget>[
            //     Text('Hello Flutter -- row'),
            //     // 因为图片尺寸过大，会报错。需要设置 size
            //     Image.network('https://img2018.cnblogs.com/blog/1115039/201906/1115039-20190626105628407-127759332.png',
            //                   width: 200,height: 200,
            //                   )
            //   ],
            // ),
            // Wrap(
            //   children: <Widget>[
            //     Text('Hello Flutter -- row'),
            //     Image.network('https://img2018.cnblogs.com/blog/1115039/201906/1115039-20190626105628407-127759332.png',
            //                   )
            //   ],
            // ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('A'),
              ),
              label: Text('AAAAA'),
            ),
            new Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('B'),
              ),
              label: new Text('BBB'),
            ),
            new Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('C'),
              ),
              label: new Text('CCCCCCCCCCCC'),
            ),new Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('D'),
              ),
              label: new Text('DDDDDDD'),
            ),new Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('E'),
              ),
              label: new Text('EEEEEEEEEEE'),
            ),new Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('F'),
              ),
              label: new Text('FFFFFFFFFFFF'),
            )
          ],
        ) 
      ),
    );
  }

 
}


