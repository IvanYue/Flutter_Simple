import 'package:flutter/material.dart';
import 'package:flutter_fluuter_bloc/Flutter_Bloc_Demo/Counter/count_demo.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: HomePage()
      
    );
  }
}

class HomePage extends StatelessWidget{
  List<Item> items = [
    Item('计数器', '0', CounterWidget()),
    Item('登录', '1', false),
    Item('name', '2', false),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
            
            itemCount: items.length,
            itemBuilder: (context,index){
              return ItemTile(
                item: items[index],
                nextPageTap:(id){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>items[index].pageName));
                },
              );
            },
            
          );
  }
}

class ItemTile extends StatelessWidget {
  final Item item;
  final Function(String) nextPageTap;

  const ItemTile({
    Key key,
    @required this.item,
    @required this.nextPageTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('${item.id}'),
      title: Text(item.name),
      onTap: ()=> nextPageTap(item.id),
    );
  }
}

class Item {
   String name;
   String id;
   dynamic pageName ;
   Item(this.name,this.id,this.pageName);
}