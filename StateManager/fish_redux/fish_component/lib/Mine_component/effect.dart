import 'package:fish_component/Model/BaseModel.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<PageState> buildEffect() {
  return combineEffects(<Object, Effect<PageState>>{
    Lifecycle.initState: _init,
    PageAction.onRefresh: _onRefresh,
  });
}

void _init(Action action, Context<PageState> ctx) {
  print('Effect:_init');

  _getBaseInfo().then((_) {
    print('updateBaseAction ===>${_.name}');
    ctx.dispatch(PageActionCreator.updateBaseAction(_.avatar, _.name, _.age));
  });

  _getJobInfo().then((_){
        ctx.dispatch(PageActionCreator.updateJobAction(_.conmany, _.job, _.detail));
  });

}

Future<BaseInfo> _getBaseInfo() async {

  print('Effect:_getBaseInfo');
  return  BaseInfo(
      'https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=0c19b995723e6709aa0d4dad5aaef458/63d9f2d3572c11df0273fa916e2762d0f603c2e6.jpg',
      10,
      '测试');
}

Future<JobInfo> _getJobInfo() async {
  print('Effect:_getJobInfo');
  return JobInfo('xxx公司', '设计', 'woshi');
}

void _onRefresh(Action action, Context<PageState> ctx) {
  print('Effect:_onRefresh');
  _getBaseInfo().then((_){
    ctx.dispatch(PageActionCreator.updateBaseAction(_.avatar,_.name,_.age));
  });
   _getJobInfo().then((_){
        ctx.dispatch(PageActionCreator.updateJobAction(_.conmany, _.job, _.detail));
  });
}
