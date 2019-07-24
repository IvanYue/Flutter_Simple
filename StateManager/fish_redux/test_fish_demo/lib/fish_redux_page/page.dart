import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class FishReduxPage extends Page<FishReduxState, Map<String, dynamic>> {
  FishReduxPage()
      : super(
            initState: initState,
            effect: buildEffect(),// 会拦截action到reducer，reducer不会响应.必须在处理完之后再dispatch
            reducer: buildReducer(),
            view: buildView,
            // dependencies: Dependencies<FishReduxState>(
            //     adapter: null,
            //     slots: <String, Dependent<FishReduxState>>{
            //     }),
            // middleware: <Middleware<FishReduxState>>[
            // ],
            );

}
