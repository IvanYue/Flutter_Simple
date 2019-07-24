

import 'package:flutter/material.dart' hide Action;

class MyExpand extends StatefulWidget {


  final List<Widget> widgets;

  MyExpand(this.widgets);

  _MyExpandState createState() => _MyExpandState();
}

class _MyExpandState extends State<MyExpand> {


  bool expand = false;
  List<Widget>  widgets = <Widget>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    
    if (expand == true) {
      widgets.clear();
      widgets.addAll(widget.widgets);
    } else {
      widgets.clear();
      widgets.add(widget.widgets[0]);
      widgets.add(widget.widgets[1]);
    }

    return Stack(
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: widgets,
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: Icon(expand?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down),
            onPressed: (){
              setState(() {
                expand = !expand;
              });
            },
          ),
        )
      ],
    );


  }
}