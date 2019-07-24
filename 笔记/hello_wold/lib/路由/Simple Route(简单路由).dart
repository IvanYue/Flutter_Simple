import 'package:flutter/material.dart';

/**
 * Router 
 *     - Flutter页面跳转
 *       Navigator 通过堆管理Route对象，从而实现页面跳转。
 *       - Simple Route(简单路由)
 *       - Named Route(命名路由)
 * 
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
      home: FirstPage()
    );
  }
}

class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        title:Text('Router -- Fristpage'),
      ),
      body: RaisedButton(
        child: Text('Jump SecondRoute'),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context)=>SecondPage()
          ));
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
      appBar:AppBar(title: Text('Router -- econdePage'),),
      body: RaisedButton(
        child: Text('Jump FirstRoute'),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    
    );
  }
}