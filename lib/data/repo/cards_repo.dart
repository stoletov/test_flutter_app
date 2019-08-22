import 'package:firebase_database/firebase_database.dart';
import 'package:testflutterapp/data/models/card.dart';

class CardsRepo {

  final database = FirebaseDatabase.instance;

  CardsRepo();

  @override
  Future<List<CardModel>> getCards() async {
    final DataSnapshot dataSnapshot = await database
        .reference()
        .child('cards')
        .once();
    final List<CardModel> cards = cardListFromDataSnapshot(dataSnapshot);
    return cards;
  }
}