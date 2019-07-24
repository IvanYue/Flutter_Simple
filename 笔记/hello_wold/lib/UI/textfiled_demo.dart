import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
void main()=>runApp(MyApp());
/**
 * StatelessWidget 
 * StatelessWidget 没有 State
 * 生命周期 只有一个 build 函数
 */
// 继承 StatelessWidget
class MyApp extends StatelessWidget{

/**
 * TextEditingController 是 TextField 的控制类，
 * 可以控制 TextField 的编辑，是 TextField 的 controller 属性，
 * 我们可以为 TextField 赋值自己创建的 TextEditingController 对象
 * 来控制 TextField
 */
  final TextEditingController _controller = TextEditingController();

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
        // body 要显示UI  
        body:TextField(
          
          // 然后使用 _controller.text 来访问 TextField 里的内容。
          controller: _controller,
          // focusNode:FocusNode.,  //用于控制TextField是否占有当前键盘的输入焦点
          decoration:InputDecoration(// 用于控制TextField的外观显示，如提示文本、背景颜色、边框等
            labelText: 'labelText',// 输入框上部分显示的
            counterText: 'counterText',//输入框显示右下角
            helperText:'helperText',//输入框显示左下角
            hintText:'hintText',// 提示语
          ) ,
          textAlign: TextAlign.center,//文本对齐方式
          textDirection: TextDirection.ltr,// 文字方向
          keyboardType: TextInputType.phone,// 键盘类型
          textInputAction: TextInputAction.continueAction,//回车键位图标
          textCapitalization: TextCapitalization.characters,//文本大写格式
          style: TextStyle(// 文本样式
            fontSize: 20,
          ),
          autofocus: true, // 是否自动获取焦点 默认 false
          obscureText: true,// 是否隐藏文本'·'代替。默认 false
          autocorrect: true, //自动修正
          maxLines: 3,// 最大行数
          maxLength: 12,//允许的最大字符数
          /**
           * //是否强制限制最大字符数，默认为true
           * true：强制限制最大字符数
           * false：不限制最大字符数，
           * 即使设置了maxLength也不生效,
           */
          maxLengthEnforced: true,
          // 输入框内容改变时的回调函数；
          //注：内容改变事件也可以通过controller来监听
          onChanged: (String data){
            // 实时获取
            print(data);
          },
          onEditingComplete:(){
            //输入完成时触发。没有参数，不会返回内容
          },
          onSubmitted: (String data){
            //输入框输入完成时触发，但是onSubmitted有参数，会返回内容
          },
          inputFormatters: [
            // 用于指定输入格式；当用户输入内容改变时，会根据指定的格式来校验。
          ],
          // enabled: false,//输入框是否禁用
          cursorWidth: 5,//光标宽度
          cursorColor: Colors.red,//光标颜色
          // cursorRadius: Radius.zero,// 光标圆角
          // 设置键盘的亮度模式 ,只能在iOS上使用
          keyboardAppearance: Brightness.dark,//
          // scrollPadding: EdgeInsets.zero,// 文本框滑动的间距
          // 设置确定当用户启动拖动时拖动正式开始的时间
          dragStartBehavior: DragStartBehavior.start,
          /** 
           * 是否启用交互式选择
           * true：长按将会选中文字，并且弹出 cut/copy/paste 的菜单
           */
          enableInteractiveSelection: true,
          onTap:(){
              //GestureTapCallback TextField的点击事件
          },
          // buildCounter: InputCounterWidgetBuilder(
          //   // 生成自定义 InputDecorator.counter 小部件的回调
          // ),
        ) 
  
      )
      
    );
  }
  
}