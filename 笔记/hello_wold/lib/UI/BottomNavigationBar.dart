import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/**
 * Flutter 功能类 Widget -- BottomNavigtionBar
 */
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '豆瓣电影'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final _widgetItems = [
    Text('热映'),
    Text('找片'),
    Text('我的')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: _widgetItems[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.school),title: Text('热映'),activeIcon: Icon(Icons.school,)),
          BottomNavigationBarItem(icon: Icon(Icons.panorama_fish_eye),title: Text('找片')),
          BottomNavigationBarItem(icon: Icon(Icons.people),title: Text('我的'))
        ],
        currentIndex: _selectedIndex,// 默认选中index
        fixedColor: Colors.black,//// 当 BottomNavigationBarType 的 type 是 fix 时，选中的选项的颜色就是 fixdColor
        /**
           * 定义底部导航栏的选项如何显示，有两个值：
              - BottomNavigationBarType.fix：当选项少于4个时，默认为这个类型，
                如果 fixedColor 不为空，则选项选中时的颜色就是 fixedColor，
                否则是 ThemeData.primaryColor，导航栏背景颜色是 ThemeData.canvasColor
              - BottomNavigationBarType.shifting：当选项不小于4个时，默认为这个类型，
                所有的选项都会被渲染为白色，但是导航栏的背景色是当前选中的选项的背景色
           */
        type: BottomNavigationBarType.fixed,//类型为fixed
        // iconSize: 30, // BottomNavigationBarItem 的 icon 的大小
        onTap: _onItemTapped,
              ),
            );
          }
          void _onItemTapped(int value) {
            // bottomBar 点击事件
            print('current BottomBar $value');
            setState(() {
              _selectedIndex = value;
            });
          }
}





