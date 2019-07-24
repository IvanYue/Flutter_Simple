import 'package:flutter/material.dart';
import 'package:hello_wold/UI/RichText-%E5%AF%8C%E6%96%87%E6%9C%AC.dart';
import 'package:hello_wold/UI/StatefulWidget.dart';


// Flutter 布局 —— 理解 BoxConstraint（盒约束）布局模型

/**
 * minWidth,maxWidth,minHeight,maxHeight
 * 0.0 <= minWidth <= Widget宽度的实际大小 <= maxWidth <= double.infinity
 * 0.0 <= minHeight <= Widget高度的实际大小 <= maxHeight <= double.infinity
 * Widget 的大小是受其 父Widget 的约束和自己 子Widget 的大小共同影响的
 */

/*** BoxConstraints：
 * 
 * Tightly Constraints(严格约束)
 *    当某一轴上的最小值和最大值相同时，那么这个轴上的值就确定了，就是 Tightly Constraints（严格约束）
 *      BoxConstraints.tight(Size(width, height))
 * Loose Constraints(松散约束):
 *    没有子weight的时候就按最大值显示,有子widget就按不超过最大值的子widget大小显示。
 *      最小值为0,设置最大值
 *          BoxConstraints.loose(Size(width, height))
 *      最大值是infinite(无限)
 *          BoxConstraints.tightFor()
 *     
 * Bounded Constraints(有界约束)
 *    当某一轴上的最大值是确定的值时
 *      constraints: BoxConstraints(minWidth:xx,maxWidth:xx,minHeight:xxx,maxHeight:xxx),
 *        - 子widget 大于最小值，小于最大值按子widget显示。
 *        - 子widget 小于最小值，小于最大值按 ，最小值显示。
 *        - 子widget 大于最大值按 ，最大值显示。
 *        - 无子widget 按最大值显示
 * 
 * Unbounded Constraints(无界约束)
 *      当某一轴上的最大值是 Infinite(无限值) 时
 *        BoxConstraints(minWidth: 100,maxWidth: double.infinity,minHeight: 100,maxHeight: double.infinity)
 *        - 当 子Widget 的宽大于 minWidth，按子Widget 的宽度
 *        - 其实 Unbounded Constraints 很像 Loose Constraints。
 *            当 Unbounded Constraints  有 子Widget 时，
 *             - 若 子Widget 的大小小于 Unbounded Constraints 的最小值时，
 *               则 Widget 显示 Unbounded Constraints 的最小值，
 *             - 若 子Widget 的大小大于 Unbounded Constraints 的最小值时，
 *               则显示 子Widge t的大小；若没有 子Widget，就相当于 match_parent
 * Infinite Constraints(无限约束)
 *      当某一轴上的最大值和最小值都是 Infinite(无限值) 
 *          BoxConstraints.expand()
 * 
 */
void main()=> runApp(MyApp('Hello World'));

class MyApp extends StatefulWidget{
  // 
  String content;
  MyApp(this.content);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp>{
  void increment(){
    setState(() {
      widget.content += 'd';
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Paint paint = Paint();
    paint.color = Colors.green;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Box Constraints'),
        ),
        body: Container(
          constraints: BoxConstraints.tight(Size(200,200)),
          color: Colors.yellow,
          child: Text('HELLOWORLD',style: TextStyle(background: paint),),
        ),
      ),
    );
  }
}
