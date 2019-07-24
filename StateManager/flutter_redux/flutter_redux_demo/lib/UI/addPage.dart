
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_demo/Action/AppActions.dart';
import 'package:flutter_redux_demo/State/AppState.dart';



class AddPageWidget extends StatefulWidget {
  AddPageWidget({Key key}) : super(key: key);

  _AddPageWidgetState createState() => _AddPageWidgetState();
}

class _AddPageWidgetState extends State<AddPageWidget> {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      builder: (context,store){
        int count = store.state.countState.count;
        return Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            Text(count.toString()),
            SizedBox(height: 10,),
            FlatButton(
              child: Icon(Icons.add),
              onPressed: (){
                store.dispatch(CountAddAction(count));
              },
            )
          ],
        ),
        );
      },
    );
  }
}