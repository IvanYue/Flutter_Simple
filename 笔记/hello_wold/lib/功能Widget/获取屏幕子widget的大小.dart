import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/**
 * Flutter 功能类 Widget -- MediaQuery
 *     MediaQuery Widget 的功能是查询一些数据，
 *      例如整个屏幕的宽度、高度、设备像素比等数据
 *      MediaQuery 会嵌套 MaterialApp
 *      
 *      - size  屏幕的逻辑像素大小
            - size.width：屏幕的宽度（逻辑像素）
            - size.height：屏幕的高度（逻辑像素）
        - devicePixelRatio: 像素比：每个逻辑像素代表的设备像素数
        - padding(EdgeInsets)：表示系统状态栏或者刘海屏的padding
        - viewInsets(EdgeInsets)：表示设备键盘的padding
        - alwaysUse24HourFormat: 格式化时间时是否使用24小时格式
        - disableAnimations：平台是否要求禁用动画

 * 
 */         


void main() => runApp(ListViewBuilderWidget(
      items: List<String>.generate(10000, (i) => "Item $i"),
    ));

  GlobalKey _globalKey = GlobalKey();


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
          title: new Text('功能类 Widget - MediaQuery'),
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
    return Column(
      children: <Widget>[
        Text(
          'Hello Flutter',
          key:_globalKey,
        ),
        RaisedButton(
          child: Text('getSize'),
          onPressed: (){
            //获取屏幕的高度
            print('Scree width：'+ MediaQuery.of(context).size.width.toString());
            print('Scree height'+ MediaQuery.of(context).size.height.toString());

          // 获取子widget的宽高
            print('Ttext width:'+_globalKey.currentContext.size.width.toString());
            print('Ttext height:'+_globalKey.currentContext.size.height.toString());

          },
        )
      ],
    );
  }
}


