import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
// 一般触发effect的函数以on开头命名
enum FishReduxAction { update ,onEdit} //action 类型

class FishReduxActionCreator {
  // 刷新action ，在按钮事件中调用，参数传入要刷新的数据
  static Action updateAction(String title, String content) {
    print('action:update');
    print(FishReduxAction.update.toString(),);
    return Action(FishReduxAction.update, // action类型
        payload: <String, String>{'title': title, 'content': content} //附带数据
        );
  }

  static Action onEditAction(){
    return Action(FishReduxAction.onEdit);
  }
}
