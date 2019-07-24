import 'package:flutter/material.dart';
import 'package:hello_wold/UI/RichText-%E5%AF%8C%E6%96%87%E6%9C%AC.dart';
import 'package:hello_wold/UI/StatefulWidget.dart';

/**
 * Flutter 容器类 Widget -  滚动widget
 *     CustomScrollView:可以使用 slivers 来自定义滑动效果的可滚动Widget。
 *       -  可以添加多个 Widget，而且可以为 Widget 提供复杂的滑动效果，
 *          需要为其 slivers 参数赋值，而且 slivers 参数只能接受特定的 Widget
 *       -  CustomScrollView 的 slivers 属性的值，只能是以 Sliver 开头的一系列 Widget
 *            -  SliverList
 *            -  SliverFixedExtentList
 *            -  SliverGrid
 *            -  SliverPadding
 *            -  SliverAppBar
 * 
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
      
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        // anchor:0.5,//初始滑动的偏移量。0从头开始，0.5中间，1最底部
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Demo'),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 4
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context,int index){
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 20,
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context,int index){
                return Container(
                  alignment:Alignment.center ,
                  color: Colors.lightBlue[100 * (index % 9)], 
                  child: Text('list item $index'),
                );
              }
            ),
          )
        ],
      )
      ),
    
    );
  }

 
}


