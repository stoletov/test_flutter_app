

import 'package:testflutterapp/data/models/card.dart';

class LoadCards{}
class ShowIndicator{}
class ShowCards {
  final List<List<CardModel>> cards;
  ShowCards({this.cards});
}
class ShowError {
  final Object error;
  ShowError({this.error});
}

