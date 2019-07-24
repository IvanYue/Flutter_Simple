import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class NoComponentMinePage extends Page<NoComponentMineState, Map<String, dynamic>> {
  NoComponentMinePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            // dependencies: Dependencies<NoComponentMineState>(
            //     adapter: null,
            //     slots: <String, Dependent<NoComponentMineState>>{
            //     }),
            // middleware: <Middleware<NoComponentMineState>>[
            // ],
            );

}
