import 'package:fish_redux/fish_redux.dart';
import 'BaseView.dart';
import 'BaseState.dart';

class BaseComponent extends Component<BaseState>{
  BaseComponent():super(
    view:buildView,
  );
}

