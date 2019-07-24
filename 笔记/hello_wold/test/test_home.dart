import 'package:flutter/material.dart';

void main() => runApp(SearchWidget());

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '测试',
      theme: ThemeData(primaryColor: Colors.red),
      home: SearchView(),
    );
  }
}

class SearchView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchWidgetState();
  }
}

class SearchWidgetState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('测试'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 10,
          ),
          SafeArea(
              child: Container(
            // color: Colors.grey[100],
            constraints: BoxConstraints(maxHeight: 50),
            // height: 40,
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Text('深圳'),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                  onTap: (){
                    print('选择城市');
                  },
                ),
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(left: 10, top: 20, right: 10),
                        hintText: '输入...',
                        fillColor: Colors.black12,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide.none)),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
