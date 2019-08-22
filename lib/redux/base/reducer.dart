
import 'package:testflutterapp/redux/cards_screen/cards_screen_reducer.dart';
import 'app_state.dart';

AppState appReducer(AppState state, action) {
  return new AppState(
    cardsScreenState: cardsScreenReducer(state.cardsScreenState, action)
  );
}