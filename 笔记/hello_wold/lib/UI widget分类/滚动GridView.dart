import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_wold/UI/RichText-%E5%AF%8C%E6%96%87%E6%9C%AC.dart';
import 'package:hello_wold/UI/StatefulWidget.dart';

/**
 * Flutter 容器类 Widget -  GridView
 *    GridView 是一个可以构建二维网格列表的 可滚动Widget。
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

      //1. 第一种：使用默认的构造函数，适用于那些只有少量 子Widget 的 GridView
      // body: GridView(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      //   children: <Widget>[
      //      ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1'))
      //   ],
      // ),


      // 2. 第二种  使用 GridView.count
      // GridView.count ==> GridView + SliverGridDelegateWithFixedCrossAxisCount
      // body: GridView.count(
      //   crossAxisCount: 3,
      //   children: <Widget>[
          // ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1'))
      //   ],
      // )


      // 3. 第三种  使用 GridView.extent
      // 只是和 GridView.count 的布局算法不同.
            // GridView.count ==> GridView + SliverGridDelegateWithMaxCrossAxisExtent
      // body: GridView.extent(
      //   maxCrossAxisExtent: 100,//viewsize
      //   children: <Widget>[
      //     ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1')), ListTile(title: Text('Title1'))
      //   ],
      // ),

      //4. 第四种:使用 GridView.builder,
        // 可用于和数据绑定实现大量或无限的列表
      // body: GridView.builder(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      //   itemCount: items.length,
      //   itemBuilder: (context,index){
      //     return ListTile(
      //       title: Text('${items[index]}'),
      //     );
      //   },
      // ),


      // 5.使用 GridView.custom
        // 增加了 childrenDelegate 的属性，类型为 SliverChildDelegate，具有定制 子Widget 的能力，
        // 和 ListView.custom 里的一样，所以用法也一样
      body:GridView.custom(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        childrenDelegate: SliverChildListDelegate(<Widget>[
          ListTile(title: Text('Title1')),ListTile(title: Text('Title1')),ListTile(title: Text('Title1')),ListTile(title: Text('Title1')),ListTile(title: Text('Title1')),ListTile(title: Text('Title1')),ListTile(title: Text('Title1')),ListTile(title: Text('Title1')),ListTile(title: Text('Title1')),ListTile(title: Text('Title1')),ListTile(title: Text('Title1')),ListTile(title: Text('Title1')),ListTile(title: Text('Title1')),ListTile(title: Text('Title1')),
        ]
        ),
      )

      ),
    
    );
  }

 
}


