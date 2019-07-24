import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

// 底部弹框：ModalBottomSheet：有半透明背景的对话框
/**
 * ModalBottomSheet 类似一个 Dialog，有一个半透明的背景层，
 * 点击背景，ModalBottomSheet 会消失。
 * 只能使用 showModalBottomSheet() 方法
 */
/** 注意事项：
 * 在使用显示 BottomSheet 的方法的时候，
 * 必须要注意这些方法只能在 Scaffold 的 子Widget 里使用，
 * 因为这些方法需要用到 Scaffold 的 Context，
 * 如果和 Scaffold 在同一层，那么就要使用 Builder。
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
                showModalBottomSheet(
                  context: context,
                  builder: (context)=>BottomSheet(
                    onClosing: (){
                      // 当 BottomSheet 关闭的时候调用这个事件可能会多次调用
                    },
                    enableDrag:true,// BottomSheet 是否可以拖动默认为true，可以向上拖、向下拖或者向下滑动关闭 BottomSheet
                    elevation: 101,//BottomSheet 相对于其父级放置的z坐标，这可以控制 BottomSheet 的阴影大小
                    // animationController:AnimationController,//控制 BottomSheet 的动画
                    // builder -> BottomSheet 要显示的内容
                    builder: (context)=>Container(
                      height: 500.0,
                      color: Colors.red,
                      child: Center(
                        child: RaisedButton(
                          onPressed: (){
                            Navigator.of(context).pop();                          
                            },
                          child: Text('dismissBottomSheet'),
                        ),
                      ),
                    ),
                  )
                );
              },
              child: Text('showBottomSheet'),
            );
          },
        ),
        
        ),
    );
  }
}

