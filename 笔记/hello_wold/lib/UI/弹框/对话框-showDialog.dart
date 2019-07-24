import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

// 对话框
/**
 * showDialog() 可以弹很多不同种类的 Dialog
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
          builder: (context){
            return RaisedButton(
              onPressed: (){
                showDialog(
                  context: context,
                  //---- SimpleDialog ---- 
                  // builder:(context)=>SimpleDialog(
                  //   title: Text('SimpleDialog Demo'),// 标题
                  //   /**
                  //    * 对话框的按钮，显示在对话框标题的下面通常是一组 SimpleDialogOption
                  //    */
                  //   children: <Widget>[
                  //     Text('data'),
                  //     SimpleDialogOption(
                  //       child: Text('确定'),
                  //       onPressed: (){
                  //         /**
                  //          * SimpleDialog 的 SimpleDialogOption 的 onPressed() 事件，
                  //          * 必须要写 Navigator.of(context).pop() ，不然弹窗不会关闭。
                  //          */
                  //         Navigator.of(context).pop();
                  //       },
                  //     ),
                  //     SimpleDialogOption(//按键
                  //       child: Text('取消'),
                  //       onPressed: (){
                  //         /**
                  //          * SimpleDialog 的 SimpleDialogOption 的 onPressed() 事件，
                  //          * 必须要写 Navigator.of(context).pop() ，不然弹窗不会关闭。
                  //          */
                  //         Navigator.of(context).pop();//
                  //       },
                  //     )
                  //   ],
                  //   // titlePadding: EdgeInsetsGeometry类型, //标题边距
                  //   // contentPadding: EdgeInsetsGeometry类型, //内容边距,
                  //   backgroundColor: Colors.red,//背景色
                  //   elevation: 4,//阴影
                  //   semanticLabel: '给文本加上一个语义标签，用于盲人辅助模式下',
                  //   // shape: ShapeBorder类型,// Widget 的形状
                  // )

                  //---- AlertDialog 安卓风格的alert---- 
                  // builder: (context)=>AlertDialog(
                  //   title: Text('AlertDialog'),// 标题
                  //   // titleTextStyle: TextStyle类型,// 标题文本格式 
                  //   // 内容
                  //   content: SingleChildScrollView(
                  //     child: ListBody(
                  //       children: <Widget>[
                  //         Text('这是一个alertdialog'),
                  //         Text('add two option')
                  //       ],
                  //     ),
                  //   ),
                  //   // 对话框的选型按钮 通常是一组 FlatButton
                  //   actions: <Widget>[
                  //     FlatButton(
                  //       child: Text("确定"),
                  //       onPressed: (){
                  //         /**
                  //          * AlertDialog 的 SimpleDialogOption 的 onPressed() 事件，
                  //          * 必须要写 Navigator.of(context).pop() ，不然弹窗不会关闭。
                  //          */
                  //         Navigator.of(context).pop();
                  //       },
                  //     ),
                  //     FlatButton(
                  //       child: Text('取消'),
                  //       onPressed: (){
                  //         /**
                  //          * AlertDialog 的 SimpleDialogOption 的 onPressed() 事件，
                  //          * 必须要写 Navigator.of(context).pop() ，不然弹窗不会关闭。
                  //          */
                  //         Navigator.of(context).pop();
                  //       },
                  //     )
                  //   ],
                  //   // contentPadding:EdgeInsetsGeometry类型,//内容边距
                  //   backgroundColor: Colors.blue,
                  //   elevation: 3.2,
                  //   semanticLabel:'给文本加上一个语义标签，用于盲人辅助模式下' ,
                  //   // shape:ShapeBorder类型 , // Widget 的形状
                  // )


                  //---- CupertinoAlertDialog ios风格的alert---- 
                  builder: (context) => CupertinoAlertDialog(
                    title: Text('IOS 风格 Alert'),
                    content: Text('这是一个CupertinoAlertDialog'),
                    actions: <Widget>[
                      CupertinoDialogAction(
                        child: Text('确定'),
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                      ),
                      CupertinoDialogAction(
                        child: Text('取消'),
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  )
                );
              },
              child: Text('showDiaLog'),

            );
          }
        )
        ),
    );
  }
}

