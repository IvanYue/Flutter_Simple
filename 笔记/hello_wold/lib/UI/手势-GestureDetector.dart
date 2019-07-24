import 'package:flutter/material.dart';


// Flutter 手势识别 Widget --- GestureDetector

/**
 * 手势事件在 Flutter 中分为两层
 *      1.第一层是原始的 pointer events(指针事件)
 *        - 它描述了屏幕上指针（例如，触摸，鼠标和触控笔）的位置和移动。
 *            例如：PointerDownEvent、PointerUpEvent 、PointerMoveEvent 、PointerCancelEvent 等。
 *        - 为了监听 pointer events，请使用 Listener Widget，
 *            但一般建议使用 GestureDetector Widget，就是下面要介绍的。
 *      2.第二层是可以对原始的事件识别成不同的手势
 *        - 第二层是对第一层原始 pointer event 事件进行识别后的手势，
 *            例如：单击、双击、长按、拖动等。
 *        - 为了识别不同的手势，请使用 GestureDetector Widget。
 * 
 *  GestureDetector 是用于检测手势的 Widget
 *      - 只要用 GestureDetector 嵌套要检测手势的 Widget 就行，
 *        然后在 GestureDetector 里实现想要监听的手势的方法就行
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
        
        body: GestureDetector(
          child: Text('Hello Flutter'),
          onTap: (){
            print('Hello Flutter');
          },
          
        )
      ),
    );
  }
}
enum MenuItem { menuA, menuB, menuC, menuD }

