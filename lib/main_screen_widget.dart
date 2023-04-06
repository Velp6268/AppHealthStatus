import 'package:flutter/material.dart';
import 'package:health_status/Frames/Group.dart';
import 'package:health_status/Frames/Profile.dart';
import 'package:flutter/material.dart';
import 'package:health_status/Architecture/DbMock.dart';
import 'package:health_status/Architecture/IDataSourse.dart';
import 'package:health_status/Architecture/Repository.dart';
import 'package:health_status/Frames/Group.dart';
import 'package:health_status/Frames/Profile.dart';
import 'Frames/Status2.dart';
import 'package:flutter/cupertino.dart';



class MainScreenWidget extends StatefulWidget {
   MainScreenWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {

  int _selectedTab = 1;
  static final List<Widget> _widgetOptions = <Widget>[
    Group(repository: LoginRepository(DbMock())),
    Status2(repository: LoginRepository(DbMock()),),
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
      bottomNavigationBar:SizedBox(
        height: 60,
        child: SingleChildScrollView(

          physics: NeverScrollableScrollPhysics(),

        child: BottomNavigationBar(
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
                  Icons.favorite,
                  color: Colors.red,
                  size: 38
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

      ),

)
    );
  }
}
