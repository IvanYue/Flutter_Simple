import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_demo/Middleware/AppMiddleware.dart';
import 'package:flutter_redux_demo/Reducer/AppReducer.dart';
import 'package:flutter_redux_demo/State/AppState.dart';
import 'package:flutter_redux_demo/UI/addPage.dart';
import 'package:flutter_redux_demo/UI/showPage.dart';
import 'package:flutter_redux_demo/UI/subPage.dart';
import 'package:redux/redux.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/lib/UI':(context) => ShowpageWidget(),
      },
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
  int _selectIndex = 1;
  final _widgetItems = [AddPageWidget(),ShowpageWidget(),SubpageWidget()];
  final _countStore = Store<AppState>(
  appReducer,
  initialState: AppState(CountState(null)),
  middleware: [appMiddleware],
  syncStream: true
);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreProvider<AppState>(
        store: _countStore,
        child: _widgetItems[_selectIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add),title: Text('加')),
          BottomNavigationBarItem(icon: Icon(Icons.remove_red_eye),title: Text('看')),
          BottomNavigationBarItem(icon: Icon(Icons.remove),title: Text('减')),
        ],
        currentIndex: _selectIndex,
        fixedColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            _selectIndex = index;
          });
        },
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
