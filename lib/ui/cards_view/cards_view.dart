import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:testflutterapp/data/models/card.dart';
import 'package:testflutterapp/redux/base/redux_base.dart';
import 'package:testflutterapp/common/resources/app_resurces.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:testflutterapp/redux/cards_screen/cards_screen_action.dart';
import 'package:testflutterapp/ui/card_details_view/card_details_view.dart';
import 'package:testflutterapp/ui/cells/card_cell_view.dart';

import 'cards_view_model.dart';

class CardsView extends StatefulWidget {
  CardsView({Key key}) : super(key: key);

  final String title = "My Cards";
  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  _CardsViewState createState() => _CardsViewState();
}

class _CardsViewState extends State<CardsView> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CardsViewModel>(
      converter: (store) => CardsViewModel.fromStore(store),
      builder: (context, viewModel) => _buildView(context, viewModel),
      onInit: (store) {
        store.dispatch(LoadCards());
        //getData();
      },
    );
  }

  Widget _buildView(BuildContext context, CardsViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(widget.title, style: TextStyle(fontSize: 26, color: Colors.black),),
        backgroundColor: AppColors.grayBarColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle, color: Colors.black, size: 35,),
          ),
        ],
      ),
      body: Material(
        child: _buildContainerView(context, viewModel),
      ),
    );
  }

  Widget _buildContainerView(BuildContext context, CardsViewModel viewModel) {
    if (viewModel.isLoading) {
      return Container(
        height: 100,
        child: Center(child:
        CircularProgressIndicator(),
        ),
      );
    } else {
      return Container(
        child: CustomScrollView(
          slivers: _buildSliverGridWithSections(context, viewModel)
        ),
      );
    }
  }

  List<Widget> _buildSliverGridWithSections(BuildContext context, CardsViewModel viewModel) {
    List<Widget> widgets = [];
    viewModel.cards.forEach((value){
      List<int> allTypes = value.map((card) => card.type).toList();
      allTypes.sort((a, b) => a.compareTo(b));
      final _categoryName = "Card type " +  allTypes.first.toString() + "-" + allTypes.last.toString();

      widgets.add(SliverList(delegate: SliverChildListDelegate([
        Container(
          height: 60,
          child: Stack(
              children: [
                Positioned(bottom: 5, left: 15, right: 15,
                    child: Text(
                      _categoryName,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),)
                ),
              ]
          ),
        )
      ])));

      widgets.add(SliverPadding(
        padding: EdgeInsets.symmetric(vertical: 21, horizontal: 16),
        sliver: SliverGrid.count(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: List.generate(value.length, (jjj) {
            return CardsCellView(
              name: 'Company name ' + value[jjj].name,
              type: _categoryName,
              index: jjj,
              onPush: (index) => _push(context, 'Company name ' + value[jjj].name, _categoryName),
            );
          }),
        ),
      ));
    });

    return widgets;
  }

  void _push(BuildContext context, String name, String type) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return CardDetailsView(
            name: name,
            type: type,
          );
        },
      ),
    );
  }

}