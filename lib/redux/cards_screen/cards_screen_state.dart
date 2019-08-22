
import 'package:testflutterapp/data/models/card.dart';

class CardsScreenState {
  final bool isLoading;
  final List<List<CardModel>> cards;

  CardsScreenState({
    this.isLoading,
    this.cards
  });

  factory CardsScreenState.initial() {
    return CardsScreenState(isLoading: false, cards: []);
  }


  CardsScreenState copyWith({
    bool isLoading,
    List<List<CardModel>> cards,
  }) {
    return CardsScreenState(
      isLoading: isLoading ?? this.isLoading,
      cards: cards ?? this.cards,
    );
  }

}