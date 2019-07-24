import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fluuter_bloc/Flutter_Bloc_Demo/Counter/Count_Bloc.dart';

class CounterWidget extends StatefulWidget {
  CounterWidget({Key key}) : super(key: key);

  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.blue),
        home: Scaffold(
          appBar: AppBar(
            title: Text('CountPage'),
          ),
          body: BlocBuilder<CounterEvent, int>(
            bloc: counterBloc,
            builder: (BuildContext context, int count) {
              return Center(
                child: Text(
                  '$count',
                  style: TextStyle(fontSize: 24.0),
                ),
              );
            },
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: FloatingActionButton(
                  onPressed: ()=> counterBloc.dispatch(CounterEvent.increment),
                  child: Icon(Icons.add),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: FloatingActionButton(
                  onPressed:()=> counterBloc.dispatch(CounterEvent.decrement),
                  child: Icon(Icons.remove),
                ),
              )
            ],
          ),
        ),
      );
  }
}
