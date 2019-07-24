//导入库
import 'package:flutter/material.dart';
// 入口函数
void main() => runApp(MyApp());//箭头语法  Lambda表达式

class Point {
    num x,y;
    // 构造函数 直接使用类名
    // Point(num x,num y){
    //   this.x = x;
    //   this.y = y;
    // }
    Point(this.x,this.y);
    //创建实例
    Point p = Point(0, 0);
    // print(p.y);// 点语法


}

// 定义一个 MyApp Widget
class MyApp extends StatelessWidget {

  //var 不是存储值，而是存储的值的对象的引用
  var content = 'Dart 语法'; //声明初始化变量
  String _name = 'by 小的';
  Object index = 100;//可以改变数据类型
  dynamic i = 10; // 可变数据类型 (少用，用object代替。混编的时候用)
  int j = 1;
  var sw = false;//不可变数据类型

  //常量 final 和 const
  // final 创建类的时候才初始化，const 编译常量，编译的时候就初始化了
  final a = 1;  
  //类里的变量需要加static
  static const b =2; //const 是 隐式的final。

  bool say(String msg,n){
      return true;
    }

  //   print(say is Function);
  //   //可选命名参数 - 按key
  //   void say1(String nanme,{num n,int j}){

  //   }

  //   say1('100',j:10);
  //   void say2(String name,{@required String n ,int i }){
      
  //   }
  //   say2('100',n:'10',i: 1);

  //   //可选位置参数 - 按顺序
  //   void say3(int i ,[num j,String name]){

  //   }
  //   say3(1,1,'1');

  //   //可选默认值
  //   void say4(int i ,[num j=0,String name]){

  //   }
  //   say4(1,1,'1');

  //   // 运算
  // Operation(){
  //   // 负数
  //   var a = -5;
  //   print(a);
  //   // 整除
  //   var b = 5 ~/2 ; // 2

  //   // ++var
  //   var c = 1; 
  //   var d = ++c; // c =2   d = 2
  //   // var++
  //   var c1 = 1; 
  //   var d1 = c1++; // c1 = 2  d1 = 1
  //   // --var
  //   var c2 = 1; 
  //   var d2 = --c2; // c2 =0   d2 = 0
  //   // var--
  //   var c3 = 1; 
  //   var d3 = c3--; // c3 =0   d3 = 1 


  //   //类型转换   as
  //   // 判断类型  is   is！


  //   // 赋值
  //   var a6,b6;
  //   a6 = 1;
  //   b6 ??= a6;  // b6 是空的话才赋值

  //   a6 ?? b6 ;  // a6 为 null 返回 b6。否则返回a6
    
  //   //  ?.  有效避免 NPE(空指针) 问题
  //   // var user = {'name':'name'};
  //   // var username = user?.name;
  //   // // 相当于
  //   // var username;
  //   // if (user == null){
  //   //   username = null;
  //   // }else{
  //   //   username = user.name;
  //   // }

  //   // ??   在赋值时，可以使用 ??，若发现为空，可以为其赋默认值

  //   // ??=  expr1 ??= expr2 等效于 expr1 = expr1 ?? expr2
  // }
    
    


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



