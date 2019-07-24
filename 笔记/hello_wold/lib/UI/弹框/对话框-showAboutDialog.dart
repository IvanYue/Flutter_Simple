import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

// 对话框
/**
 * showAboutDialog() 和 showDialog() 只能在 
 * MaterialApp 的 子Widget 里使用，因为这两个方法
 * 需要使用 MaterialApp 的 context，所以解决问题的办法
 * 就和前一节讲 SnackBar 和 Builder 的使用 一样，
 * 要么使用 Builder，要么将 Widget 单独拆分出来。
 */

void main()=> runApp(ShowAboutDialogWidget());

class ShowAboutDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.red
      ),
      home: Scaffold(
        appBar:AppBar(title: Text("Flutter UI - 对话框"),) ,
        body: Builder(
          builder: (context)=>RaisedButton(
            onPressed: (){
              showAboutDialog(
                context: context, //应用上下文
                applicationName: 'Flutter showAboutDialog', //应用的名字
                applicationVersion: '1.0.0', //应用的版本
                applicationIcon: Image.asset('UI/lifecycle.jpg'),// 应用Icon
                applicationLegalese:'应用的法律信息',
                children: [] //添加在后面的Widget
              );
            },
            child:Text('RaisedButton') ,
          ),
        ),
        ),
    );
  }
}

