import 'package:flutter/material.dart';
import 'package:hyperhire_assingment/screens/screens.dart';

class BottomNavigationItems {
  static List<Widget> userScreenWidgets = [
    const HomeScreen(),
    Container(),
    Container(),
  ];

  static List<BottomNavigationBarItem> get userBottomNavigationBarList => [
        const BottomNavigationBarItem(
          icon: Padding(padding: EdgeInsets.all(4.0), child: Icon(Icons.home)),
          label: 'Home',
          activeIcon: Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(
                Icons.home,
              )),
        ),
        const BottomNavigationBarItem(
          icon: Padding(padding: EdgeInsets.all(5), child: Icon(Icons.chat_bubble_outline)),
          label: 'Chat',
          activeIcon: Padding(
              padding: EdgeInsets.all(5),
              child: Icon(
                Icons.chat,
              )),
        ),
        const BottomNavigationBarItem(
          icon: Padding(
              padding: EdgeInsets.all(4.2),
              child: Icon(
                Icons.settings,
              )),
          label:'Profile',
          activeIcon: Padding(
              padding: EdgeInsets.all(4.2),
              child: Icon(
                Icons.settings,
              )),
        ),
      ];
}
