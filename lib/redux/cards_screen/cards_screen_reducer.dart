import 'package:redux/redux.dart';
import 'cards_screen_action.dart';
import 'cards_screen_state.dart';

final cardsScreenReducer = combineReducers<CardsScreenState>([
  TypedReducer<CardsScreenState, ShowIndicator>(_showIndicator),
  TypedReducer<CardsScreenState, ShowCards>(_showCards),
]);

CardsScreenState _showIndicator(CardsScreenState state, ShowIndicator action) {
  return state.copyWith(
      isLoading: true
  );
}

CardsScreenState _showCards(CardsScreenState state, ShowCards action) {
  return state.copyWith(
      isLoading: false,
      cards: action.cards,
  );
}

