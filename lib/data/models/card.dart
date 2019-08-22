import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';

List<CardModel> cardListFromDataSnapshot(DataSnapshot dataSnapshot) {
  final Iterable iterable = dataSnapshot.value.values;
  return List<CardModel>.from(
      iterable.map((map) => CardModel.initial(map)));
}

String cardInfoToJson(CardModel data) => json.encode(data.toJson());

class CardModel {
  String name;
  int type;

  CardModel({
    this.name,
    this.type
  });

  factory CardModel.initial(Map map){
    return CardModel(
        name: map['name'],
        type: map['type']
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type
  };

}