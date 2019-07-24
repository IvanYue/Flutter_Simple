import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/**
 * Flutter 功能类 Widget -- Navigator 
 *     Navigator 是用来管理页面显示的 Widget，这些页面以堆栈的数据结构存储，
 *     当有新页面显示时，就会把上一个页面压入栈，所以栈底是最初的 页面，栈顶是当前的页面。
 *     -  Routes
 *        - 移动应用将全屏幕显示的叫做 “screens” 或者 “pages”，
 *           在 Flutter 里叫做Routes（路由），Navigator 就是用来管理 Routes 显示的 Widget。
 *        - Navigator.push
 *        - Navigator.pop
 */ 

/**
 *  InheritedWidget
 *     - InheritedWidget 可以高效的将数据在 Widget树 中向下传递，
 *       通常用来共享数据，Flutter中非常重要的一个功能 Widget。
 *     - 前面介绍的 Theme 和 MediaQuery 之所以可以在 子Widget 内访问到数据，
 *        就是使用到了 InheritedWidget。
 *     - 以将共享的数据在 InheritedWidget 里实现，这样 A页面和 B 页面都可以直接访问数据并修改，
 *        数据一旦修改，就会触发依赖这个数据的 UI 的刷新。
 *        InheritedWidget 在 Flutter 开发中有很大的作用。
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
          title: new Text('功能类 Widget - InheritedWidget'),
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


