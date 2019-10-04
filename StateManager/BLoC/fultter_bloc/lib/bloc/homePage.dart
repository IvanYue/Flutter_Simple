import 'package:flutter/material.dart';
import 'package:fultter_bloc/bloc/bloc_provice.dart';
import 'addPage.dart';
class HomeWidget extends StatefulWidget {
  HomeWidget({Key key}) : super(key: key);

  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC'),
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
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddPageWidget()));
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
// class HomeWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final bloc = BlocProvider.of(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('BLoC'),
//       ),
//       body: Center(
//         child: StreamBuilder<int>(
//             stream: bloc.stream,
//             initialData: bloc.vlaue,
//             builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
//               return Text(
//                 'You hit me: ${snapshot.data} times',
//                 style: Theme.of(context).textTheme.display1,
//               );
//             }),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context)
//               .push(MaterialPageRoute(builder: (context) => AddPageWidget()));
//         },
//         child: Icon(Icons.navigate_next),
//       ),
//     );
//   }
// }

