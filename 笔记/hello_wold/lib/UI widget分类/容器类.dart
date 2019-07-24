import 'package:flutter/material.dart';
import 'package:hello_wold/UI/RichText-%E5%AF%8C%E6%96%87%E6%9C%AC.dart';
import 'package:hello_wold/UI/StatefulWidget.dart';

/**
 * Flutter 容器类 Widget - 
 *     - 容器类Widget 不同于 布局类Widget： 
 *        - 布局类Widget 的子Widget 一般都是数组,
 *          而容器类Widget 的子Widget 一般只有一个.
 *        - 布局类Widget 是按照一定的排列方式对其子Widget进行排列，
 *          而容器类Widget 用于嵌套其他Widget，对Widget添加一些修饰(补白或者背景色),
 *          变换(旋转或者裁剪等),限制(大小等).
 *     
 *     - Padding
 *        - Padding 的必填参数是 padding，然后其 child 参数就是你想要添加 padding 的 Widget
 *     - Container
 *        - Container 是一个拥有绘制、定位、调整大小的 Widget。
 *     
 *     - Align
 *        - Align 可以控制其 子Widget 的对齐方式，并可以根据 子Widget 的大小自动调整自己的大小。
 *     - Center
 *        - Center 可以将其 子Widget 居中显示在自身内部。
 *          Center 继承自 Align，其实就是 alignment 为 Alignment.center 的 Align。
 *     -
 * 
 * 
 */         


void main()=> runApp( new FlexWidget());

class FlexWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Test',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter 容器 Widget'),
        ),

        // body:Padding(
        //   //容器内边距
        //   // padding: EdgeInsets.all(10),
        //   // padding: EdgeInsets.only(left: 10,right: 100,top: 50,bottom: 0),
        //   padding: EdgeInsets.symmetric(vertical: 110.0,horizontal: 100),
        //   child: Text('容器Widget--Padding'),
        // )

        // body: Container(
        //   //外边距
        //   margin: EdgeInsets.only(top: 50,left: 120),//容器外补白
        //   // 容器大小限制
        //   constraints: BoxConstraints.tightFor(width: 200,height: 150),//卡片大小
        //   transform: Matrix4.rotationZ(.2),//容器的变化
        //   alignment: Alignment.center,//内部child对齐方式
        //   padding: EdgeInsets.all(0),//内边距
        //   // color: Colors.cyan,//背景色
        //   width: 200,
        //   height: 200,
        //   child: Text(
        //     //卡片文字
        //     'Hello Container',
        //     style:TextStyle(
        //       color:Colors.white,
        //       fontSize: 40.0
        //     )
        //   ),
        //   //UIforegroundDecoration:nil, 前景装饰
        //   //背景装饰
        //   decoration: BoxDecoration(
        //     //背景装饰
        //     gradient: RadialGradient(
        //       //背景径向渐变
        //       colors: [Colors.green,Colors.red,Colors.yellow],
        //       center: Alignment.topLeft,
        //       radius: .98
        //     ),
        //     boxShadow: [
        //       //阴影
        //       BoxShadow(
        //         blurRadius: 4,
        //         color: Colors.black54,
        //         offset: Offset(2, 2)
        //       )
        //     ]
        //   ),
        // ),

        // body: Align(
        //   alignment: Alignment.center,
        //   widthFactor: 1,
        //   heightFactor: 1,
        //   child: Text(
        //     'Hello Flutter --- Align',
        //     style:TextStyle(
        //       color:Colors.red,
        //       fontSize:20,
        //       backgroundColor: Colors.yellow 
        //     )
        //   ),
          
        // ),
        

        body: Center(
          child: Text(
            'Hello Flutter --- Center',
            style:TextStyle(
              color:Colors.red,
              fontSize:20,
              backgroundColor: Colors.yellow 
            )
          ),
        ),
      ),
    );
  }

 
}


