import 'package:redux/redux.dart';
import 'package:testflutterapp/redux/cards_screen/cards_screen_middleware.dart';
import 'app_state.dart';

List<Middleware<AppState>> appMiddleware() {
  final appMiddleware = <Middleware<AppState>>[];
  appMiddleware.addAll(CardsMiddleware().getMiddleware());
  return appMiddleware;
}