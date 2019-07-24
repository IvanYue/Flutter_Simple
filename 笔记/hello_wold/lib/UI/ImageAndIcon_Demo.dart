import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
void main()=>runApp(MyApp());
/**
 * StatelessWidget 
 * StatelessWidget 没有 State
 * 生命周期 只有一个 build 函数
 */
// 继承 StatelessWidget
class MyApp extends StatelessWidget{
  // 实现 build 函数，返回一个 Widget
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      // Scaffold 是MateriaApp的顶级容器，会自动适配屏幕
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter UI基础Widget -- 富文本'),),
        // iconfont 字体图标
        // body: Icon(
        //   Icons.accessible,
        //   size: 50,//icon的大小
        //   color: Colors.green,//icon的颜色
        //   textDirection: TextDirection.ltr,//Icon的绘制方向
        //   semanticLabel:'给 Image 加上一个语义标签 ,没有实际用处',
        // )
        // body 要显示UI  本地图片
        body: Image.asset(
          'lib/UI/lifecycle.jpg',
          fit: BoxFit.contain,//用于在图片的显示空间和图片本身大小不同时指定图片的适应模式
          scale: 0.8,//图形显示的比例
          semanticLabel: '给 Image 加上一个语义标签没有实际用处',
          // width: 200,
          // height: 200,
          color: Colors.red,//图片的混合色值
          colorBlendMode: BlendMode.color,// 图片与颜色的混合模式
          alignment: Alignment.center,//对齐方式
          repeat: ImageRepeat.repeat,//当图片本身大小小于显示空间时，指定图片的重复规则
          // centerSlice: Rect.zero,//在这个矩形范围内的图片会被当成.9的图片
          matchTextDirection: true,//图片的绘制方向  true:从左往右false:从右往左
          gaplessPlayback: true,// 当图像提供者更改时，true显示旧图，flase 简单的显示任何内容
          filterQuality:FilterQuality.low//这只图片的过滤质量
          )
        // 网络图片
        // body: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557781801455&di=17f9f2fc3ded4efb7214d2d8314e8426&imgtype=0&src=http%3A%2F%2Fimg2.mukewang.com%2F5b4c075b000198c216000586.jpg')
          // body: Image.file( ),// 从文件加载图片
          // body: Image.memory(),// 从内存中加载bytes数据，类型是Uint8List
      )
      
    );
  }
  
}