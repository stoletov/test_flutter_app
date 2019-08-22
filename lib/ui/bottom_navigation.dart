import 'package:flutter/material.dart';
import 'package:testflutterapp/common/resources/app_resurces.dart';


enum TabItem { map, cards, shops, saving }

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.grayBarColor,
      iconSize: 28,
      selectedFontSize: 13,
      unselectedFontSize: 13,
      items: [
        _buildItem(tabItem: TabItem.map),
        _buildItem(tabItem: TabItem.cards),
        _buildItem(tabItem: TabItem.shops),
        _buildItem(tabItem: TabItem.saving),
      ],
      onTap: (index) => onSelectTab(
        TabHelper.item(index: index),
      ),
    );
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) {

    String text = TabHelper.description(tabItem);
    IconData icon = TabHelper.icon(tabItem);
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(item: tabItem),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTabMatching(item: tabItem),
        ),
      ),
    );
  }

  Color _colorTabMatching({TabItem item}) {
    return currentTab == item ? Colors.black87 : Colors.grey[400];
  }

}

class TabHelper {
  static TabItem item({int index}) {
    switch (index) {
      case 0:
        return TabItem.map;
      case 1:
        return TabItem.cards;
      case 2:
        return TabItem.shops;
      case 3:
        return TabItem.saving;
    }
    return TabItem.map;
  }

  static String description(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.map:
        return 'Map';
      case TabItem.cards:
        return 'Cards';
      case TabItem.shops:
        return 'Shop';
      case TabItem.saving:
        return 'Saving';
    }
    return '';
  }
  static IconData icon(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.map:
        return Icons.map;
      case TabItem.cards:
        return Icons.credit_card;
      case TabItem.shops:
        return Icons.store;
      case TabItem.saving:
        return Icons.save;
    }
    return Icons.menu;
  }

}
