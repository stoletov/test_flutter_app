
import 'package:testflutterapp/redux/cards_screen/cards_screen_state.dart';

class AppState {

  final CardsScreenState cardsScreenState;

  AppState({
    this.cardsScreenState
});

  factory AppState.initial(){
    return AppState(
      cardsScreenState: CardsScreenState.initial()
    );
  }

  AppState copyWith() {
    return AppState(
      cardsScreenState: cardsScreenState ?? this.cardsScreenState
    );
  }

}
