import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_status/Frames/ProfileWidget.dart';
import 'package:health_status/Architecture/Repository.dart';
import 'package:health_status/Frames/Profile/OtherWidgets/TextFieldWidget.dart';
import 'package:health_status/ui/profile_btn_Save.dart';
import 'package:health_status/Theme/app_colors.dart';

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
              imagePath: student.imageName,
              isEdit: true,
              onClicked: () async {},
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.028),
            TextFieldWidget(
              ///Строка Имени
              label: 'Полное Имя',
              text: student.fullName,
              onChanged: (name) {},
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.028),
            TextFieldWidget(
              ///Строка Email
              label: 'Email',
              text: student.email,
              onChanged: (email) {},
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.25),

            // ButtonTheme(
            //   child: Container(
            //     height: MediaQuery.of(context).size.height * 0.05,
            //     width: 10,
            //     child: DecoratedBox(
            //       ///Вид элемента листа (табличка)
            //       decoration: BoxDecoration(
            //           border: Border.all(color: AppColors.mainGrey),
            //
            //           ///Окружность краев Элемента списка
            //           borderRadius: const BorderRadius.only(
            //               topRight: Radius.circular(25),
            //               bottomRight: Radius.circular(25),
            //               topLeft: Radius.circular(25),
            //               bottomLeft: Radius.circular(25)),
            //           color: color),
            //   )
            //
            //   ),


            
            



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
