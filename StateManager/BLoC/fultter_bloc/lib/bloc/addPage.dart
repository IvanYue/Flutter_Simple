import 'package:flutter/material.dart';
import 'package:fultter_bloc/bloc/bloc_provice.dart';
import 'package:fultter_bloc/bloc/countBloc.dart';


class AddPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddPageWidgetState();
  }
}

class AddPageWidgetState extends State<AddPageWidget> {
  
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('addPage'),
      ),
      body: Center(
        child: StreamBuilder<int>(
            stream: bloc.stream,
            initialData: bloc.vlaue,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text(
                'You hit me: ${snapshot.data} times',
                style: Theme.of(context).textTheme.display1,
              );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // add
          bloc.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
