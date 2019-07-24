import 'package:flutter/material.dart';

/**
 * 传参
 * 1.通过 Navigator.push() 或者 Navigator.pushNamed() 方法传递参数
 * 
 * 2.通过 Widget 的构造函数传递参数
 */

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        initialRoute: '/First',
        routes: {
          '/First': (context) => FirstPage(),
          "/Second": (context) => SecondPage()
        },
        home: FirstPage());
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Route -- FirstPage"),
      ),
      body: RaisedButton(
        child: Text("JUMP SecondRoute"),
        onPressed: () {
          _jumpToSecondPage(context);
        },
      ),
    );
  }

//接受的数据就是 Navigator.pushNamed() 返回的结果，为了不阻塞 UI，这里用了 async。
  _jumpToSecondPage(BuildContext context) async {
    dynamic passArgumnets = await Navigator.pushNamed(context, '/Second',
        arguments: PassArgumnets('Data from FirstPage Navigator.pushNamed()'));
    print(passArgumnets.content);
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PassArgumnets passArgumnets =
        ModalRoute.of(context).settings.arguments;

    print(passArgumnets.content);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Route -- SecondPage"),
      ),
      body: RaisedButton(
        child: Text("Go back!"),
        onPressed: () {
          Navigator.pop(context, PassArgumnets('Return Data from SecondPage'));
        },
      ),
    );
  }
}

class PassArgumnets {
  String content;

  PassArgumnets(this.content);
}