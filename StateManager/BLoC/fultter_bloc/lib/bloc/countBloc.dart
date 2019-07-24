import 'dart:async';

class CounterBLoc{

  int _count = 0;

  var sc = StreamController<int>.broadcast(); // 广播形式

  Stream<int>  get stream => sc.stream;
  int get vlaue => _count;

  increment(){
    sc.sink.add(++_count);
  }

  dispose(){
    sc.close();
  }

}




// class CountBLoC {
//   int _count = 0;
//   var _countController = StreamController<int>.broadcast();

//   Stream<int> get stream => _countController.stream;
//   int get value => _count;

//   increment() {
//     _countController.sink.add(++_count);
//   }

//   dispose() {
//     _countController.close();
//   }
  
// }