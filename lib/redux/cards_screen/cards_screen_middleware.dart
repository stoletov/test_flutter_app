import 'package:redux/redux.dart';
import 'package:testflutterapp/data/models/card.dart';
import 'package:testflutterapp/data/repo/cards_repo.dart';
import 'package:testflutterapp/redux/base/redux_base.dart';
import 'cards_screen_action.dart';

class CardsMiddleware {
  CardsMiddleware();

  final CardsRepo cardsRepo = CardsRepo();

  List<Middleware<AppState>> getMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, LoadCards>(_getCards),
    ];
  }


  Future _getCards( Store<AppState> store, LoadCards action, NextDispatcher next,) async {
    next(ShowIndicator());
    cardsRepo.getCards().then((cards) {

      List<List<CardModel>> filteredList = [];
      List<CardModel> one = cards.where((card) => card.type <= 2).toList();
      one.sort((a, b) => a.name.compareTo(b.name));
      List<CardModel> two = cards.where((card) => card.type >= 3 && card.type <= 6).toList();
      two.sort((a, b) => a.name.compareTo(b.name));
      List<CardModel> three = cards.where((card) => card.type >= 7).toList();
      three.sort((a, b) => a.name.compareTo(b.name));
      filteredList.add(one);
      filteredList.add(two);
      filteredList.add(three);
      store.dispatch(ShowCards(cards: filteredList));
    }).catchError((error) {
      store.dispatch(ShowError(error: error));
    });
    next(action);
  }

}
