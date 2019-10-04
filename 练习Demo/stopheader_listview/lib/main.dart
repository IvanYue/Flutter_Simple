import 'package:flutter/material.dart';
import 'package:stopheader_listview/testModel.dart';
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
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  List<TestModel> _testList = new List();
  String headerTitle;
  @override
  void initState() {
    // TODO: implement initState
    super.initState(); 
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  }
}
