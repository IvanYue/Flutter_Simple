import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=> runApp(SnackBarBuilderWidget());

class SnackBarBuilderWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Flutter SnackBar'
          ),
        ),
        //使用 Builder 包裹
        // body: Builder(
        //   builder: (context)=>RaisedButton(
        //     child: Text('Show SnackBar'),
        //     onPressed: (){
        //       Scaffold.of(context).showSnackBar(SnackBar(
        //         content: Text('SnackBar'),
        //         duration: Duration(seconds: 5)
        //       ));
        //     },
        //   ),
        // ) 
        // 将使用 SnackBar 的 Widget 拆分出来
        body: SnackBarWidget()
      ),
    );
  }
}

class SnackBarWidget extends StatelessWidget{
          @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      child: Text('显示 SnackBar'),
      onPressed: (){
        Scaffold.of(context).showSnackBar(SnackBar(
          content:Text('显示SnackBar 5秒'),// SnackBar 显示的主要内容
          duration:Duration(seconds: 5),//SnackBar 显示的时间,默认是4.0s
          backgroundColor: Colors.red,//SnackBar 的背景色
          action: SnackBarAction(
            //SnackBarAction	SnackBar 的按钮
          ),
          // animation: Animation, //Animation	SnackBar 显示和消失的动画
        ));
      },
    );
  }
}
