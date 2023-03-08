import 'package:flutter/material.dart';
import 'package:health_status/Frames/Group.dart';
import 'package:health_status/Frames/Status.dart';
import 'package:health_status/Frames/Profile.dart';


class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {

  int _selectedTab = 1;

  static const List<Widget> _widgetOptions = <Widget>[
    Group(),
    Status(),
    Profile(),
  ];

  void onSelectTab(int index){
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Center(child: _widgetOptions[_selectedTab]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        iconSize: 28.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
                Icons.group
            ),
            label: 'Group',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.heart_broken_rounded,
                size: 34
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.home
            ),
            label: 'Profile',
          ),
        ],
        onTap: onSelectTab ,
      ),
    );
  }
}
