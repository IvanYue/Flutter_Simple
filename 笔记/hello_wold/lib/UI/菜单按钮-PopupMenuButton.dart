import 'package:flutter/material.dart';


// PopupMenuButton 是一个按钮，当你点击按钮的时候，就会弹出类似 Android 选项菜单的框。
/**
 * PopupMenuButton 是点击后会弹出菜单选项的按钮，
 * 其 child 参数是用来显示按钮的内容，
 * itemBuilder 参数是用来显示弹出的菜单，
 * onSelected 参数用于处理菜单点击事件
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
        
        body: PopupMenuButton(
          // icon: Icon(  // 这个按钮里显示的 Icon Widget，
          //   Icons.accessible,
          //   size: 50,
          //   color: Colors.red,
          //   textDirection: TextDirection.ltr,//Icon的绘制方向
          // ),
          //这个按钮里显示的内容
          child: Text('PopupMenuButton'),
          onSelected: (MenuItem result){
            // 点击事件
            print('clikc' + result.toString());
          },
          onCanceled: (){
            // 取消选择
          },
          // 要显示的菜单
          itemBuilder: (BuildContext context)=><PopupMenuEntry<MenuItem>>[
            const PopupMenuItem<MenuItem>(
              child: Text('menu A'),
              value: MenuItem.menuA,
              ),
              const PopupMenuItem<MenuItem>(
                child: Text('menu B'),
                value: MenuItem.menuB,
              ),
              const PopupMenuItem<MenuItem>(
                child: Text('meun C'),
                value: MenuItem.menuC,
              ),
              const PopupMenuItem(
                child: Text('menu D'),
                value: MenuItem.menuD,
              )
          ],
        )
      ),
    );
  }
}
enum MenuItem { menuA, menuB, menuC, menuD }

