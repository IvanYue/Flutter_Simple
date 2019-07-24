import 'package:flutter/material.dart';

void main()=>runApp(FormWidget());

class FormWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FromWidgetState ();
      }
      
}
    
class FromWidgetState extends  State<FormWidget> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  String _name ;
  String _password;
  String _old;
  String _userGender;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Form'),),
        body: Form(

          key: _formKey,// Widget 的标识
          //child:Form 的子 Widget, Column 排列方式
          child: Column( 
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(hintText: '用户名'),
                validator:(value){
                  if (value?.length <=5) {
                    return '用户名必须大于5个字符';
                  }
                },
                onSaved: (value){
                  _name = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: '密码'),
                validator: (value){
                  if(value?.length<8){
                    return '密码必须大于8位';  
                  } 
                },
                onSaved: (value){
                  _password = value;
                },
              ),
              TextField(
                onChanged: (Value){
                  _old = Value;
                },
              ),
              DropdownButtonFormField(
                value: _userGender,
                items: ['男','女'].map((label)=>DropdownMenuItem(
                  child: Text(label),
                  value: label,
                  )
                ).toList(),
                onChanged: (value){
                    setState(() {
                      _userGender = value;
                    });
                  },
                  onSaved:(value){
                    _userGender = value;
                  }
              ),
              RaisedButton(
                child: Text('注册'),
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    _formKey.currentState.save();
                    print(_old);
                    print(_userGender);
                    print(_name);
                    print(_password);
                    
                  }
                },
              )
            ],
          ),
                    /**
           * 是否自动验证，默认为 false
           * true：每次输入有变动都会验证
           * false：只有调用 FormFieldState.validate 才会验证
           */
          autovalidate:false,
          onWillPop:(){
            /**
             * 决定 Form 所在的路由是否可以直接返回（如点击返回按钮），
             * 这个回调会返回一个 Future 对象，如果 Future 的最终结果是 false，则当前路由不会返回；
             * 如果为 true，则会返回到上一个路由。此属性通常用于拦截返回按钮。
             */
          },
          onChanged:() {
            // Form 的任意一个 子FormField 内容发生变化时会触发此回调
            print('onChanged');
            // 只有  子FormField  内容变化才会触发
          },
        ),
      ),
    );
  }
}