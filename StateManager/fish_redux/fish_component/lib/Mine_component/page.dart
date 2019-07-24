import 'package:fish_component/Mine_component/jobInfo/JobComponent.dart';
import 'package:fish_redux/fish_redux.dart';

import 'baseInfo/BaseComponent.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';


class InfoPage extends Page<PageState, Map<String, dynamic>> {
  InfoPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PageState>(
                adapter: null,
                slots: <String, Dependent<PageState>>{
                  'base':BaseConnector() + BaseComponent(),
                  'job':JobConnector() + JobComponent()
                }),
            // middleware: <Middleware<NoComponentMineState>>[
            // ],
            );

}
