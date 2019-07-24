import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/**
 * Flutter 功能类 Widget -- Theme
 *     Theme Widget 的功能是为 MaterialApp 定义主题数据，
 *       - 如导航栏颜色、标题字体、Icon样式
 *       - Theme 会嵌套 MaterialApp。
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
      theme: ThemeData(
        primaryColor: Colors.blue,//
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('功能类 Widget - Theme'),
        ),
        body: ChildText(),
      ),
    
    );
  }
}
class ChildText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      'Hello Flutter - Theme',
      style:TextStyle(
        // 获取主题颜色
        color:Theme.of(context).primaryColor
      )
    );
  }
}


