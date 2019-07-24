import 'package:flutter/material.dart';

//  StatefulWidget 里 Widget  => 创建 State
class XXX extends StatefulWidget{
  @override
  //StatefulWidget 的生命周期只有 createState
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyApp();
  }
}

/**
 * State 生命周期
 * moundted is true
 * mounted 是 boolean，只有当mounted 为 true 
 * 时，才能使用 setState()。
 * StatefulWidget 里 State => 创建 Widget,更新状态，刷新 UI
 */
class  MyApp extends State<XXX>{
  
  @override
  /**
   * 构造函数之后，第一个要调用的方法，完成后就有了State对象
   * 之后就可以使用 BuildContext 了。
   * 可以在这里执行其的他初始化，例如执行依赖于 BuildContext 
   * 或 Widget 的初始化，或者 animations、 controllers 
   * 等动画相关的初始化。
   */ 
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState');
    context.runtimeType;
  }
  /**
   * 1.initState() 方法运行完后，就立即运行 didChangeDependencies() 方法。
   * 2.当 Widget 依赖的数据被调用时，此方法也会被调用。
   * 3.如果您的 Widget 链接到 InheritedWidget(继承部件)，则每次重建此窗口小部件时都会调用此方法。
   */
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  //当状态有变化，需要刷新UI的时候，就调用 setState()，会触发强制重建 Widget。
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    print('setState');
  }
  /**
   * 1.当 Widget 重建后，新的 Widget 会和旧的 Widget 进行对比，
   * 如果新的 Widget 和旧的 Widget 的 runtimeType 和 Widget.key 都一样，
   * 那么就会调用 didUpdateWidget()。
   * 2.在 didUpdateWidget() 里，会把新的 Widget 的配置赋值给 State，相当于重新 initState() 了一次。
   * 3.调用完这个方法之后，再去调用 build() 方法。
   */
  @override
  void didUpdateWidget(XXX oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  /** 
   * 构建Widget
   * 1.在  didChangeDependencies 或 didUpdateWidget 后调用
   * 2.每次 State 对象更改时（或者当 InheritedWidget 需要通知“已注册”的小部件时）都会调用此方法！
   * 3.为了强制重建，需要调用 setState() 方法。
   */
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

  

  /**
   * 1.当 State 从树中移除时，就会触发 deactive
   */

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');
  }
  /**
   * 当 StaefulWidget 从树中移除时调用 dispose() 方法。
   * 执行一些清理逻辑（例如侦听器）
   */
  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print('reassemble');
  }

  
}

