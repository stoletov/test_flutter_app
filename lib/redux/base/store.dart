
import 'package:redux/redux.dart';
import 'redux_base.dart';


Store<AppState> createAppStore() {
  return new Store<AppState>(
    appReducer,
    initialState: new AppState.initial(),
    middleware: appMiddleware(),
  );
}