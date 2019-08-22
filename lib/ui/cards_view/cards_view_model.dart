import 'package:redux/redux.dart';
import 'package:testflutterapp/data/models/card.dart';
import 'package:testflutterapp/redux/base/redux_base.dart';

class CardsViewModel {
  final bool isLoading;
  final List<List<CardModel>> cards;

  CardsViewModel({this.isLoading, this.cards});

  static CardsViewModel fromStore(Store<AppState> store) {
    return new CardsViewModel(
      isLoading: store.state.cardsScreenState.isLoading,
      cards: store.state.cardsScreenState.cards,
    );
  }
}