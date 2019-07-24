import 'package:flutter/material.dart';

/**
 * Dart 代码运行在 Isolate 上
 *  Dart 代码运行的环境叫 Isolate，Dart 代码默认跑在 root Isolate 上。
 *  当 Dart 代码正在运行时，同一个 Isolate 中的其他代码无法同时运行。
 *  Flutter 可以拥有多个 Isolates，但 Isolates 之间不能共享内存。
 */

/**
 * 异步编程
 * 1.Future API
 *    Future API 是用来写异步代码的.
 *     - then 等操作符
 * 2.async 和 await （完全替代 Future API）
 *     - async 和 await 是 Dart 语言用来支持异步编程的关键字.
 *     - 使得 Dart 可以用同步代码的方式来写异步代码.且不需要Future API 极大的降低了一步代码的复杂度，方便阅读。
 *     - 给函数加上 async关键字，使函数变为异步函数，await 关键字只能在异步函数里用。
 * 3. 如果想暂停代码运行直到 complete Future object 返回
 *     - 在 async 函数里使用 await 关键字
 *     - 对 Future 对象使用then方法
 */




// 异步中捕捉异常
void gather() async{
  try{
    var content = await gatherNewsReports();
  }catch(e){

  }
}

// 在 async 函数里使用 await 关键字
void gather1() async{
  var a = await gatherNewsReports();
}
//函数返回一个Future<String>对象
Future<String> gatherNewsReports(){
  //...
}
void thenFunc() => print('object');
//Future<String>对象 使用 Future API的then操作符
void gather2(){
  //对 Future 对象使用then方法
  var then2 = gatherNewsReports().then(
      (content)=>{
        print('异步操作')
      }
    );
    
}



