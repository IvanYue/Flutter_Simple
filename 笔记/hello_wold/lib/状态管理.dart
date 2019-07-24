/**
 * 好的状态管理框架应该具有的条件
 *     - 能管理好全局状态和本地状态
 *     - UI 逻辑和业务逻辑应该是分离的
 *     - 在框架的帮助下可以写出高质量的代码
 *     - 框架应该提升 App 的性能
 *     - 框架要容易理解，便于扩展
 */

/**
 * InheritedWidget
 *     方法：
 *      1.定义 InheritedWidget，InheritedWidget 里存储全局的数据。
 *      2.InheritedWidget 必须是父 Widget。
 *      3.InheritedWidget 的子 Widget 通过特定的方法取到 InheritedWidget 的实例，然后就可以访问 InheritedWidget 的数据。
 *      4.当全局数据发生变化时，需要重新创建 InheritedWidget，重建的同时会根据条件通知 InheritedWidget 的子 Widget。
 *     
 *      总结：(不推荐使用)
 *        - 优点：可以对全局状态进行管理
 *        - 缺点：
 *          - 无法管理本地状态
 *          - UI逻辑和业务逻辑没有分开
 *          - 数据只能从上到下传递，无法从下到上传递
 *          - 随着App变大，代码难于维护
 */

import 'dart:async';
import 'dart:core' as prefix0;
import 'dart:core';

/**
 * ScopedModel  第三方库，该库是从 Fuchsia 的代码库中提取的
 *      - Model :Model 是类，用来存储全局状态，当状态发生变化时，调用 notifyListeners() 方法，
 *               就会通知给依赖这个状态的子 Widget，引起子 Widget 的创建。
 *               我们需要继承 Model 类来写自己的 Models.
 *      - ScopedModel:
 *               ScopedModel 是 Widget，用来共享全局状态，可以将 Model 里的状态传递给它的子 Widget。
 *               为了将状态传递给子 Widget，我们需要使用 ScopedModel 来包 Model。
 *      - ScopedModelDescendant:
 *               ScopedModelDescendant 也是 Widget，用于需要依赖 Model 里状态的子 Widget 中，
 *               而且会自动订阅 Model 里状态的变化，当 Model 里状态发生变化时，
 *               就会触发 ScopedModelDescendant 的重建。
 * 
 * 子Widget 中获取 Model 的方法
 *        1.使用 ScopedModelDescendant，可以获取 Model，并且在 Model 变化时会重建。
 *        2.使用 ScopedModel.of 的静态方法获取 Model 实例，但是无法收到 Model 变化的通知。
 *          如果需要频繁使用，可以在 Model 里写一个静态方法，下面会讲到。
 * 
 * 
 *  总结：(大型App不能使用，不推荐使用)
 *        优点:
 *          1.可以对全局状态进行管理
 *          2.数据只能从上到下传递，也可以从下到上传递
 *        缺点:
 *          1.UI 逻辑和业务逻辑没有分开
 *          2.无法管理本地状态
 *          3.随着 App 变大，代码维护也会变得越来越难
 *  
 */

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

/**
 * 第三方库：flutter_bloc
 * BLoC模式:  Business Logic Component 业务逻辑组件 
 *      BLoC 模式指的是一种开发模式，使用这种模式可以使代码的 UI 逻辑和业务逻辑完全分离，
 *      从而可以在多个平台（mobile、web、后台等）上重用代码，这里的代码重用指的是业务逻辑代码的重用。
 * 
 *      使用了响应式编程，是一种开发模式
 * 
 * 步骤：
 *    Widget 向 BLoC 发送事件
 *    事件会触发 BLoC 里的 sink
 *    然后 Stream 会把 State 通知给 Widget
 * 
 * 特点：
 *    BLoC 依赖响应式编程
 *    有 Event 和 State
 * 
 * BLoC 实现了业务逻辑层和 UI 逻辑的分离，为此带来了巨大的好处。
 *    可以用对 App 影响最小的方式修改业务逻辑
 *    可以修改 UI，而不用担心影响业务逻辑
 *    更加方便单元测试
 * 
 * 第三方库：flutter_bloc
 * 
 * 暴露出几个类，我们只要使用这几个类变可以轻松实现 BLoC 模式
 *     - Bloc：是BLoC开发模式中的一个类。
 *         包含了 Event、State，也有 sink、stream 响应式编程，不过 sink、stream 响应式编程已经被 flutter_bloc 框架实现，我们只要关心 Event 和 State 就行，
 *          Event:外部接收的事件，State 是输出 Widget 关心的状态
 *     - BlocBuilder:是一个 Widget
 *          BlocBuiler 监听 Bloc 的状态，当状态发生变化时，就重建 Widget.
 *          两个参数：必选
 *            - Bloc:监听已经实现的 Bloc 类
 *            - BlocWidgetBuilder:监听 Bloc 类里状态的变化，重建 Widget
 *     - BlocProvider：是一个 Widget
 *          可以将 Bloc 类提供给它的子 Widget。BlocProvider 经常用来作为依赖注入的部件，
 *          以便将单个 Bloc 类的实例，在多个 Widget 里共享。
 *     - BlocProviderTree：是一个 Widget
 *          BlocProvider 是把一个 Bloc 实例共享到多个 Widget 里，有时候一个 Widget 也需要用到多个 Bloc
 *     - BlocListener：是一个 Widget
 *          两个参数:
 *             - Bloc:
 *             - BlocWidgetListener:类似于 BlocBuilder，需要接收一个 Bloc 类作为参数
 *                   - 返回是void，不用返回 Widget。所以用来做一些其他操作
 *                   - 例如：弹对话框、弹 SnackBar、跳转到新的页面等。
 *     - BlocListenerTree：BlocListenerTree 是一个 Widget，用于将多个 BlockListener 合成一个 Widget。
 *    
 * 
 */

/**
 * Redux 
 * Redux 是 JavaScript 状态容器，提供可预测化的状态管理，经常和React 一起使用。当你的场景非常复杂：
 *      1.某个组件的状态，需要共享
 *      2.某个状态需要在任何地方都可以拿到
 *      3.一个组件需要改变全局状态
 *      4.一个组件需要改变另一个组价的状态
 *  步骤：
 *  view --->  Action ---> Middleware(耗时操作,异步) ---> Reducer(纯函数、业务逻辑，生成新state)
 *   ↑                                                    |
 *   |                                                    |
 * Store(存储共享State，一个应用只有一个)<---------------------
 * 
 * 
 *  纯函数：函数式编程的一部分，满足3个原则：
 *        1.变量都只爱函数作用域内获取，作为函数的参数传入
 *        2，不会产生副作用，不会改变被传入的数据或者其他数据
 *        3.相同的输入保证相同的输出
 *    所以纯函数bug少。
 * 
 * 
 * flutter_redux
 *  相关类：Reducer、Middleware、Store、StoreProvider、StoreBuild、StoreConnector
 *        Reducer:函数
 *          1.响应Action，进行逻辑操作，然后生成新State。
 *          2.typedef State Reducer<State>(State state,dynamic action)
 *              state:前一个状态
 *              action:一个操作，有参数就用Enum，没有参数就用Class
 *      Middleware：中间件
 *          1.处于Action和Reducer之间，可以在Reducer之前拦截Action.
 *            因为有时不能立马拿到想要的数据，需要发请求等耗时操作，所以就不能写成同步的，需要Middleware
 *            来处理异步操作，等取到想要的数据后发送给Reducer。
 *          2.参数：
 *            state:前一个状态
 *            action：操作
 *            next：结束执行 middleware
 * 
 *      Store:
 *          1.来存储和共享状态的，Store定义里有一个泛型，这个泛型就是Store要存储和共享的状态
 *          2.参数
 *            redux：新生产的 state，必传
 *            T{
 *              initialState:初始化状态
 *              middleware：中间件执行的耗时操作
 *              syncStream：是否同步，默认false 异步
 *              distinct：状态相同时是否响应onchange方法，默认false，响应
 *              }
 *      StoreProvider：
 *           1.一个Widget,可以将制定的Store传递给它的子Widget
 *           2.参数：
 *                store:前面创建的store，表示要将这个Store传递给子Widget
 *                child:子widget
 * 
 *      StoreBuild:
 *           1.一个Widget,它要作为StoreProvider的子Widget，可以从StoreProvider获取Store并传给
 *             StoreBuilder 里面的builder方法用于创建Widget.
 *           2.StoreBuilder会自动订阅Store,当Store发生变化时，就会自动重建Widget
 *           3.参数：
 *              builder:ViewModelBuilder<Store<S>>,创建Widget
 *              onlnit:OnlnitCallback<S>  初始化时候调用
 *              onDispose:OnlnitCallback<S>   销毁时调用
 *              rebuildOnChange: 当Store变化时不需要创建Widget，默认为需要
 *              onWillChange: 状态变化时调用，在build之前
 *              onDidChange:   状态变化后调用，在build之后
 *              onlnitialBuild： widget第一次 build 的时候调用
 *          4.一般不使用StoreBuilder,而使用StoreConnector。
 *              StoreBuilder 会把整个 store 传给子Widget
 *              StoreConnector 提供了converter 方法 可以把Store处理成子Widget想要的数据后传给子Widget
 *      
 *       StoreConnector：
 *            1.一个Widget，
 *            2.作为StoreProvider的子Widget，可以从StoreProvider中获取store,并使用 connverter 方法
 *              将store转化为子Widget像要的数据类型，然后传递给builder方法创建Widget
 *            3，会自动订阅，store变化，就自动重建
 *            4.参数
 *                builder:创建widget
 *                converter：将store处理成子Widget想要的数据
 *                onlnit:初始化时候调用
 *                onDispose:OnlnitCallback<S>   销毁时调用
 *                rebuildOnChange: store变化需不需要重建，默认需要
 *                onWillChange: 状态变化时调用，在build之前
 *                onDidChange:   状态变化后调用，在build之后
 *                onlnitialBuild： widget第一次 build 的时候调用
 */

//flutter_redux 定时器例子

//1.创建全局状态
class AppState {
  int count;
  AppState(this.count);
}

// 2.定义一个自增的Action
enum Actions { Increment }

/** 
 * 3.Middleware：中间件 处于Action和Reducer之间，可以在Reducer之前拦截Action.
 * 因为有时不能立马拿到想要的数据，需要发请求等耗时操作，所以就不能写成同步的，需要Middleware
 * 来处理异步操作，等取到想要的数据后发送给Reducer。
 */

typedef void Middleware<State>(
  Store<State> store, //前一个状态
  dynamic action, //一个操作
  NextDispatcher next, //使用next方法结束Middleware的执行，将Action从Middleware传向Reducer
);

//4.Reducer:返回的状态必须是新建的，而不能复用之前的。
AppState counterReducer(AppState state, dynamic action) {
  if (action == Actions.Increment) {
    return AppState(state.count + 1);
  }

  return AppState(state.count);
}

// 5，Store 是用来存储和共享状态的，Store定义里有一个泛型，这个泛型就是Store要存储和共享的状态
/**
 * class Store<State>{。。。}
 * Store (
 *    this.redux, ==> Reducer<State> ==> 响应Action 生成新的State
 *    {
 *      State initialState,==> State ==> 初始化状态
 *      List<Middleware<State>> middleware = const[],==> Redux里的Middleware ，在Action和Reducer之间，处理耗时操作
 *      bool syncStream:flase  ==> 表示middleware里的操作是否是同步的，默认异步
 *      bool distinct:false  ==> 当接收到的状态和前一个状态相同时，是否触发 conChange事件，默认触发
 *    }
 * )
 */

final appStateStore = Store<AppState>(counterReducer,
    initialState: AppState(0), middleware: [loggingCounter]);

// StoreProvider : 一个Widget,可以将制定的Store传递给它的子Widget
// StoreBuilder :一个Widget，要作为StoreProvider的子Widget，可以获取Store，并传递给StoreBuilder
// 里的builder方法用于创建Widget。还会自动订阅Store，Store变化就会自动重建。
class storeprovider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreProvider<AppState>(
      store: appStateStore,
      child: StoreBuilder<AppState>(
        builder: (context, viewmodel) {
          return Text(viewmodel.state.count.toString());
        },
      ),
    );
  }
}
// StoreConnector : 一个Widget，可以处理store后再传给Widget,
class storeprovider2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreProvider<AppState>(
      store: appStateStore,
      child: StoreConnector<AppState,String>(
        converter: (store)=>store.state.count.toString(),
        builder: (context, value) {
          return Text(value);
        },
      ),
    );
  }
}

// 加完后需要打印
void loggingCounter(
    Store<AppState> store, dynamic action, NextDispatcher next) async {
  if (action == Actions.Increment) {
    print('counter is ${store.state.count.toString()}');
  }
  next(action);
}
