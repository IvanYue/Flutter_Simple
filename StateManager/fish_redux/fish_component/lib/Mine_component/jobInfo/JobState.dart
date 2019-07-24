import 'package:fish_redux/fish_redux.dart';

class JobState implements Cloneable<JobState> {
  String company;
  String job;
  String detail;
  JobState();

  @override
  JobState clone() {
    // TODO: implement clone
    return JobState()
      ..company = company
      ..job = job
      ..detail = detail;
  }
}

JobState initState(Map<String,dynamic>params){
  return JobState();
}