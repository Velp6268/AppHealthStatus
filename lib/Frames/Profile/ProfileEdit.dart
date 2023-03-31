import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_status/Architecture/auth/UserRepository.dart';
import 'package:health_status/Frames/Profile/Widget/ProfileWidget.dart';
import 'package:health_status/Architecture/Repository.dart';
import 'package:health_status/Frames/Profile/OtherWidgets/TextFieldWidget.dart';
import 'package:health_status/Theme/app_colors.dart';

class ProfileEdit extends StatefulWidget {


  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileEdit> {




  @override
  Widget build(BuildContext context) {
    final student = UserSession.get();
    final color = Theme.of(context).colorScheme.primary;
    final VoidCallback onClicked;

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
              imagePath: student!.imageName,
              isEdit: true,
              onClicked: () async {},
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.028),
            TextFieldWidget(
              ///Строка Имени
              label: 'Полное Имя',
              maxLengthelements: 22,
              text: student.fullName,
              onChanged: (name) {},
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.028),
            TextFieldWidget(
              ///Строка Email
              label: 'Email',
              maxLengthelements: 30,
              text: student.email,
              onChanged: (email) {},
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.3),


               ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(10),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                )),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
                child: const SizedBox(
                  height: 25,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                     'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25
                        ),
                      ),
                  ),
                ),
                ),


      ],
    ),
    );

  }
}
