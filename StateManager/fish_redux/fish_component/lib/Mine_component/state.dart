import 'package:fish_component/Mine_component/jobInfo/JobState.dart';
import 'package:fish_redux/fish_redux.dart';
import 'baseInfo/BaseState.dart';
class PageState implements Cloneable<PageState> {


  String avatar;
  String name;
  int age;

  String company;
  String job;
  String detail;

  PageState();

  @override
  PageState clone() {
    return PageState()
    ..name=name
    ..avatar=avatar
    ..age=age
    ..company=company
    ..job=job
    ..detail=detail;
  }
}

PageState initState(Map<String, dynamic> args) {
  return PageState();
}



class BaseConnector extends ConnOp<PageState,BaseState>{

  @override
  BaseState get(PageState page) {
    final BaseState sub = BaseState();
    sub.avatar=page.avatar;
    sub.name = page.name;
    sub.age = page.age;
    return sub;
  }

  @override
  void set(PageState page, BaseState sub) {
    // TODO: implement set
    page.avatar = sub.avatar;
    page.name = sub.name;
    page.age = sub.age;
  }

}

class JobConnector extends ConnOp<PageState,JobState>{
  @override
  JobState get(PageState page) {

    final JobState jobState = JobState();
    jobState.company = page.company;
    jobState.job = page.job;
    jobState.detail = page.detail;

    return jobState;
  }

  @override
  void set(PageState state, JobState subState) {
    state.company = subState.company;
    state.job = subState.job;
    state.detail = subState.detail;
  }
}