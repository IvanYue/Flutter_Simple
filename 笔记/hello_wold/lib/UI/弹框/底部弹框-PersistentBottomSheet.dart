import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

// 底部弹框：PersistentBottomSheet：持续的底部对话框
/**
 * PersistentBottomSheet：持续的底部对话框
 * 持续的 BottomSheet，当 BottomSheet 弹出时，
 * 会一直覆盖在 APP 的界面上，而且背景是透明的，
 * 所以你还可以和界面有其他交互，且点击背景不能让 
 * PersistentBottomSheet 消失。除非点击返回，
 * PersistentBottomSheet 才会消失。
 */
/** 注意事项：
 * 在使用显示 BottomSheet 的方法的时候，
 * 必须要注意这些方法只能在 Scaffold 的 子Widget 里使用，
 * 因为这些方法需要用到 Scaffold 的 Context，
 * 如果和 Scaffold 在同一层，那么就要使用 Builder。
 */

/**
 * PersistentBottomSheet 出现时,
 * TitleBar 的右上角会多一个返回的按钮，
 * 可以关闭 PersistentBottomSheet，
 * 因为 PersistentBottomSheet 无法通过点击背景关闭。
 * 
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
        // body: Builder(
        //   builder: (context){
        //     return RaisedButton(
        //       onPressed: (){
        //          // 点击后显示 bottomsheet
        //         showBottomSheet(
        //           context: context,
        //           builder: (context)=>BottomSheet(
        //             onClosing: (){
        //               // 当 BottomSheet 关闭的时候调用这个事件可能会多次调用
        //             },
        //             enableDrag:true,// BottomSheet 是否可以拖动默认为true，可以向上拖、向下拖或者向下滑动关闭 BottomSheet
        //             elevation: 101,//BottomSheet 相对于其父级放置的z坐标，这可以控制 BottomSheet 的阴影大小
        //             // animationController:AnimationController,//控制 BottomSheet 的动画
        //             // builder -> BottomSheet 要显示的内容
        //             builder: (context)=>Container(
        //               height: 500.0,
        //               color: Colors.red,
        //               child: Center(
        //                 child: RaisedButton(
        //                   onPressed: (){
        //                     Navigator.of(context).pop();                          
        //                     },
        //                   child: Text('dismissBottomSheet'),
        //                 ),
        //               ),
        //             ),
        //           )
        //         );
        //       },
        //       child: Text('showBottomSheet'),
        //     );
        //   },
        // ),



        body: RaisedButton(
          onPressed: (){},
          child: Text('showBottomSheet'),
        ),

        // 一创建就会显示出 bottomsheet
        bottomSheet: BottomSheet(
          onClosing: (){},
          builder: (context)=>Container(
            height: 200,
            color: Colors.red,
            child: Center(
              child: RaisedButton(
                onPressed: (){
                  // Navigator.of(context).pop();
                  print('hiddenBottonSheet');
                },
                child: Text('hiddenBottonSheet'),
              ),
            ),
          ),
        ),
        ),
    );
  }
}

