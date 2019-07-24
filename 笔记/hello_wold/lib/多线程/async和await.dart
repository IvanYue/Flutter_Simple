import 'package:flutter/material.dart';

/**
 * async
 * 异步函数是函数标有 async 修饰符的函数。async 只能用来修饰函数。
 *      - 当调用异步函数时，异步函数里的代码都是同步执行的，
 *      - 直到遇到 await ，await 会立即返回一个 uncompleted Future 对象，
 *      - 但函数的主体也会暂停执行，直到 uncompleted Future 执行完成，
 *      - 返回一个带结果的 complete Future 对象，函数的主体才会接着运行
 */

/**
 * await - await 只能在 async 函数里使用，如果用在普通函数里，会报语法错误。
 * await 表达式允许你用写同步代码的方式来写异步代码。
 *      - await 会阻塞当前的操作，直到结果返回才会执行下一步。
 *      - 而且请注意，await 只能在 async 里面使用。
 * 如果 await 后面的表达式返回值不是 Future 对象，那么会自动被 Future 对象封装。
 */

void getFromServer() async{
  var content =  await fetch();
  print(content);
}
String fetch(){
  return 'infomation';
}
