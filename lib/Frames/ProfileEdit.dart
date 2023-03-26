import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_status/Frames/ProfileWidget.dart';
import 'package:health_status/Architecture/Repository.dart';
import 'package:health_status/Frames/Profile/OtherWidgets/TextFieldWidget.dart';


class ProfileEdit extends StatefulWidget {
  final Repository repository;
  const ProfileEdit({Key? key, required this.repository}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileState(repository);
}

class _ProfileState extends State<ProfileEdit> {

  final Repository repository;
  _ProfileState(this.repository);


  @override
  Widget build(BuildContext context) {

    final student = repository.getAll().first;


    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black87),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(CupertinoIcons.moon_stars, color: Colors.black87),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: student.imageName,
            isEdit: true,
            onClicked: () async {},
          ),

          const SizedBox(height: 24),
          TextFieldWidget(             ///Строка Имени
            label: 'Полное Имя',
            text: student.fullName,
            onChanged: (name) {},
          ),

          const SizedBox(height: 24),
          TextFieldWidget(             ///Строка Email
            label: 'Email',
            text: student.email,
            onChanged: (email) {},
          ),



        ],
      )
    );
  }


}
