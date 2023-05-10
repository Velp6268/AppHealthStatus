import 'package:flutter/material.dart';
import 'package:health_status/Architecture/groups/GroupApiClient.dart';
//import 'package:health_status/Architecture/IDataSourse.dart';

import 'package:health_status/Architecture/groups/StudentRepository.dart';
import 'package:health_status/Architecture/profile/ProfileApiClient.dart';
import 'package:health_status/Architecture/profile/ProfileRepository.dart';
import 'package:health_status/Architecture/status/StatusRemoteDbMock.dart';
import 'package:health_status/Architecture/status/StatusRepository.dart';
import 'package:health_status/Frames/Group/GroupAdminView.dart';
import 'package:health_status/Frames/Group/GroupForModer.dart';
import 'package:health_status/Frames/Group/GroupForUser.dart';
import 'package:health_status/Frames/Profile/Profile.dart';
import 'package:health_status/Frames/Status2.dart';
import 'Architecture/auth/LoggedUserRepository.dart';
import 'Architecture/auth/UserSession.dart';
import 'Architecture/user/UserDbMock.dart';

class MainScreenWidget extends StatefulWidget {
  MainScreenWidget({Key? key}) : super(key: key);



  @override
  // ignore: library_private_types_in_public_api
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

checkRole() {
  if (UserSession.returnRole() == 2) {
    return GroupAdminView(repository: StudentRepository(GroupApiClient()));
  } else if (UserSession.returnRole() == 1) {
    return GroupModerView(repository: StudentRepository(GroupApiClient()));
  } else if (UserSession.returnRole() == 0) {
    return GroupUserView(repository: StudentRepository(GroupApiClient()));
  } else {
    return throw Exception("null");
  }
}

class _MainScreenWidgetState extends State<MainScreenWidget> {


  int _selectedTab = 1;
  static final List<Widget> _widgetOptions = <Widget>[
    checkRole(),
    Status2(
      repository: StatusRepository(StatusRemoteDbMock()),
    ),
    Profile(
        repository:
            ProfileRepository(ProfileApiClient())),
  ];

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: _widgetOptions[_selectedTab]),
        bottomNavigationBar: SizedBox(
          height: MediaQuery.of(context).size.height * 0.08
          ,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: BottomNavigationBar(
              currentIndex: _selectedTab,
              iconSize: 28.0,

              ///loll
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.group),
                  label: 'Group',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite, color: Colors.red, size: 38),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Profile',
                ),
              ],
              onTap: onSelectTab,
            ),
          ),
        ));
  }
}
