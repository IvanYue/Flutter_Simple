import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(CounterWidget());

class CounterWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CounterState();
  }
}

class CounterState extends State<CounterWidget>{

  int _count = 0;

  // 1.实现 StreamController
  static final StreamController<int> _streamController = StreamController<int>();
  // 2. StreamSink 通过 _streamController.sink 获取，
  static final StreamSink<int> _sink = _streamController.sink;
  // 3. Stream 通过 _streamController.stream 获取：
  static final Stream<int> _stream = _streamController.stream;
  // 4.通过 _sink 发送消息，在 _stream 处接受消息

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter 响应式编程'),
        ),
        body: StreamBuilder(
          //因为Text是widget,所以要用streamBuilder包裹
          stream: _stream, // 接受 _stream 里的数据
          initialData: 0,// 默认数据为0
          builder: (context,snapShot){
            // snapShot.data 表示的是接受到的数据。
            return Center(
              child: Text('${snapShot.data}'),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            //不用关心具体的业务，只负责发送事件
            _calculate();
          },
        ),
      ),
    );
  }
  void _calculate(){
    // _sink 发送消息
    _sink.add(++_count);
  } 
}
enum CounterEvent{increment,decrement}
class CountBloc extends Bloc<CounterEvent,int>{

  @override
  // TODO: implement initialState
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield currentState -1;
        break;
      case CounterEvent.increment:
        yield currentState +1;
        break;
    }
  }
}