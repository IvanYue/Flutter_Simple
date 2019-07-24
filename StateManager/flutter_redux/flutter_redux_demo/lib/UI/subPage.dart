import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_demo/Action/AppActions.dart';
import 'package:flutter_redux_demo/State/AppState.dart';




class SubpageWidget extends StatefulWidget {
  SubpageWidget({Key key}) : super(key: key);

  SubpageWidgetState createState() => SubpageWidgetState();
}

class SubpageWidgetState extends State<SubpageWidget> {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      builder: (context,store){
        int count = store.state.countState.count;
        print('SubPageWidget ===>$count');
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(count.toString()),
              SizedBox(height: 10,),
              FlatButton(
                onPressed: (){
                  store.dispatch(CountRemoveAction(count));
                },
                child: Icon(Icons.remove),
              )
            ],
          ),
        );
      },
    );
  }
}