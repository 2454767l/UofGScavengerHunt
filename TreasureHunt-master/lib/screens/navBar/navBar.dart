import 'package:U_of_G_Treasure_Hunt/screens/leaderboard/leaderboard.dart';
import 'package:U_of_G_Treasure_Hunt/screens/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home/home.dart';

class OurNavBar extends StatefulWidget {
  const OurNavBar({Key? key}) : super(key: key);

  @override
  State<OurNavBar> createState() => _OurNavBarState();
}

class _OurNavBarState extends State<OurNavBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const HomeScreen(),
    const MyLeaderboard(),
    const OurProfile(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(0, 56, 101, 20),
        unselectedItemColor: Colors.white70,
        selectedItemColor: Colors.white,
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: 'Map',
              backgroundColor: Colors.white10),
          BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard),
              label: 'Leaderboard',
              backgroundColor: Colors.white10),
          BottomNavigationBarItem(
              icon: Icon(Icons.groups_outlined),
              label: 'Profile',
              backgroundColor: Colors.white10),
        ],
      ),
    );
  }
}
