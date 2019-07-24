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
        appBar: AppBar(title: Text('Flutter UI基础Widget -- 文本'),),
        // body 要显示UI
        body: Text(
          'Hello World',
          style: TextStyle(
            inherit: true,//是否继承父Text样式 默认 true
            color: Colors.red,//文字颜色
            fontSize: 20,//文字大小
            // background: new Paint()..color = Colors.yellow, // 背景色，
            // backgroundColor: Colors.blue,//背景色 不能喝background共用
            fontWeight: FontWeight.bold,//字体粗细
            fontStyle: FontStyle.italic,//是否倾斜
            letterSpacing: 10,//字母之间的间隔
            wordSpacing: 20,//单词之间的间隔
            textBaseline: TextBaseline.ideographic,//对齐文本的水平线
            locale: Locale.cachedLocale,//语言格式首选标识符
            // foreground: new Paint()..color = Colors.yellow,//文本前景色 不能和color同时出现
            shadows:[Shadow(
                color: Colors.red,
                offset: Offset(5, 5),
                blurRadius:15
            )],
            decoration: TextDecoration.underline,//文本线条
            decorationColor: Colors.green,//线条颜色
            decorationStyle: TextDecorationStyle.wavy,//线条样式
            debugLabel: '文本样式的描述，无实际用处',
            fontFamily: '用于设置使用哪种自定义字体',
            fontFamilyFallback: [
              '字体列表，当fontFamily 找不到时在这个里面找'
            ],
            package: '用于设置使用哪种自定义字体'
          ),
          textScaleFactor:0.8,//缩放因子
          strutStyle: StrutStyle.disabled,//每行最小行高
          textAlign: TextAlign.center,//对齐方式
          textDirection: TextDirection.ltr,//文字方向
          locale: Locale.cachedLocale,//语言格式首选标识符
          softWrap: true,//是否允许换行
          overflow: TextOverflow.clip,//截断方式
          maxLines: 10,//最大行数
          semanticsLabel: '给文本加上一个语义标签,没有实际用处',
        ),
      )
      
    );
  }
  
}