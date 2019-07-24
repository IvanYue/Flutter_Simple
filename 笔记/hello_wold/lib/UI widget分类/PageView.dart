import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_wold/UI/RichText-%E5%AF%8C%E6%96%87%E6%9C%AC.dart';
import 'package:hello_wold/UI/StatefulWidget.dart';

/**
 * Flutter 容器类 Widget -  PageView
 *     PageView 是可以一页一页滑动的 可滚动Widet。
 *     其 子Widget 会占据当前屏幕的所有可见区域。
 */         


void main() => runApp(ListViewBuilderWidget(
      items: List<String>.generate(10000, (i) => "Item $i"),
    ));

class ListViewBuilderWidget extends StatelessWidget{

  final List<String> items ;

  ListViewBuilderWidget({Key key, @required this.items}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Test',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter 容器 - 滚动widget'),
        ),


        // 1. 使用默认构造函数
        // body: PageView(
        //   onPageChanged:(index){
        //     print('current page $index');
        //   } ,
        //   children: <Widget>[
        //     ListTile(title:Text('Title0')),ListTile(title:Text('Title1')),ListTile(title:Text('Title2')),ListTile(title:Text('Title3')),ListTile(title:Text('Title4')),
        //   ],
        // ),


          //2. 使用 使用 PageView.builder,
            // 可用于和数据绑定实现大量或无限的列表

          // body: PageView.builder(
          //   onPageChanged: (index){
          //     print('current page $index');
          //   },
          //   itemCount: items.length,
          //   itemBuilder: (context,index){
          //    return ListTile(title:Text('${items[index]}'));
          //   },
          // ),

          // 3.使用 PageView.custom
              // childrenDelegate  --- SliverChildDelegate
          body: PageView.custom(
            onPageChanged:(index) {
              print('current page $index ');
            },
            childrenDelegate: SliverChildListDelegate(
              <Widget>[
                ListTile(title: Text('Title0')),
              ListTile(title: Text('Title1')),
              ListTile(title: Text('Title2')),
              ListTile(title: Text('Title3')),
              ListTile(title: Text('Title4')),
              ]
            ),
          ),




      ),
    
    );
  }

 
}


