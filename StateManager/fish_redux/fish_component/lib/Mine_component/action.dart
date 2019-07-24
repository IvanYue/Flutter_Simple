import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PageAction { 
  updateBase,//更新基本信息
  updateJob,//更新工作信息
  onRefresh//更新事件
 }

class PageActionCreator {

  static Action updateBaseAction(String avatar,String name,int age){
    print('updateBaseAction');
    return Action(
      PageAction.updateBase,
      payload: <String,dynamic>{'avatar':avatar,'name':name,'age':age},
    );
  }

  static Action updateJobAction(String company,String job,String detail){
    print('updateJobAction');
    return Action(
      PageAction.updateJob,
      payload: <String,String>{'company':company,'job':job,'detail':detail}
    );
  }

  static Action onRefreshAction() {
    print('onRefreshAction');
    return const Action(PageAction.onRefresh);
  }
}
