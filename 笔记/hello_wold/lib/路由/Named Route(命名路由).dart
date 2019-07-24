import 'package:flutter/material.dart';

/**
 * Router 
 *     - Flutter页面跳转
 *       Navigator 通过堆管理Route对象，从而实现页面跳转。
 *       - Simple Route(简单路由)
 *          
 *       - Named Route(命名路由)
 *        - 如果 App 里有很多地方都要跳转到相同的页面，
 *          那么以前面简单路由的方式跳转的话，就得重复写很多代码，
 *          这种情况下，为 Route 命名，使用命令路由就会很方便
 *        - 命名的路由不能使用 '/'，因为 '/' 相当于是根节点，
 *          不要用根节点去命名路由。
 */

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      initialRoute: '/First',
      routes: {
        '/First':(context)=>FirstPage(),
        '/Second':(context)=>SecondPage(),
      },
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        title:Text('Name Router -- Fristpage'),
      ),
      body: RaisedButton(
        child: Text('Jump SecondRoute'),
        onPressed: (){
          Navigator.pushNamed(context, '/Second');
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(title: Text('Name Router -- econdePage'),),
      body: RaisedButton(
        child: Text('Jump FirstRoute'),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    
    );
  }
}