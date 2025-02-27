import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hyperhire_assingment/screens/screens.dart';

import '../utils/utils.dart';

class HomeNavigateScreen extends StatefulWidget {
  final int? page;

  const HomeNavigateScreen({super.key, this.page});

  @override
  _HomeNavigateScreenState createState() => _HomeNavigateScreenState();
}

class _HomeNavigateScreenState extends State<HomeNavigateScreen> {
  @override
  Future<void> afterFirstLayout(BuildContext context) async {}

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int _currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [BottomNavigationItems.userScreenWidgets.elementAt(_currentSelected)],
        ),
        bottomNavigationBar: Container(
          height: kIsWeb ? kToolbarHeight * 1.2 : (Platform.isIOS ? kToolbarHeight * 1.6 : kToolbarHeight * 1.2), // ✅ Fix for Web
          width: screenWidth,
          decoration: BoxDecoration(
            color:Colors.white,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 5, blurRadius: 5)],
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            iconSize: 25,
            selectedLabelStyle: const TextStyle(
              fontSize: 10,
              fontFamily: semiBold,
              height: 1.5,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 10,
              fontFamily: semiBold,
              height: 1.5,
            ),
            onTap: (int index) {
              setState(() {
                _currentSelected = index;
              });
            },
            currentIndex: _currentSelected,
            showUnselectedLabels: true,
            items: BottomNavigationItems.userBottomNavigationBarList,
          ),
        ));
  }
}
