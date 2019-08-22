import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:testflutterapp/redux/base/store.dart';
import 'ui/main_view.dart';

void main() => runApp(TestFlutterApp());

class TestFlutterApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: createAppStore(),
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainView(),
      ),
    );
  }
}

