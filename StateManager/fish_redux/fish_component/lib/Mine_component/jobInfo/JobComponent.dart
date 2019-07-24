import 'package:fish_component/Mine_component/jobInfo/JobState.dart';
import 'package:fish_redux/fish_redux.dart';
import 'JobView.dart';

class JobComponent extends Component<JobState>{
  JobComponent():super(
    view:buildView,
  );
}
