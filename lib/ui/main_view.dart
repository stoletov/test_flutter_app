import 'package:flutter/material.dart';
import 'bottom_navigation.dart';
import 'cards_view/cards_view.dart';

class MainView extends StatefulWidget {

  const MainView({ Key key }) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainViewState();
}

class MainViewState extends State<MainView> {

  TabItem _selectedTab = TabItem.cards;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCurrentPage(),
      bottomNavigationBar: BottomNavigation(
        currentTab: _selectedTab,
        onSelectTab: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(TabItem tabItem) {
    setState(() {
      _selectedTab = tabItem;
    });
  }

  Widget _buildCurrentPage() {
    switch (_selectedTab) {
      case TabItem.map:
        return null;
      case TabItem.cards:
        return CardsView();
      case TabItem.shops:
        return null;
      case TabItem.saving:
        return null;
      default:
        return null;
    }
  }

}


