import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_status/Architecture/auth/LoggedUserRepository.dart';
import 'package:health_status/Architecture/auth/UserSession.dart';
import 'package:health_status/Architecture/profile/ProfileRepository.dart';
import 'package:health_status/Frames/Profile/Widget/ProfileWidget.dart';
import 'package:health_status/Frames/Profile/OtherWidgets/TextFieldWidget.dart';
import 'package:health_status/Theme/app_colors.dart';
import 'package:health_status/resources/resources.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class ProfileEdit extends StatefulWidget {
  final ProfileRepository repository;

  const ProfileEdit({Key? key, required this.repository}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState(repository);
}

class _ProfileEditState extends State<ProfileEdit> {
  _ProfileEditState(this.repository);

  final ProfileRepository repository;


  @override
  Widget build(BuildContext context) {
    final id = UserSession.get()?.userId;
    var user = repository.getByUserId(id!);
    final color = Theme.of(context).colorScheme.primary;
    final VoidCallback onClicked;
    final imageUser = user?.imageName ?? AppImages.man;



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
            imagePath: imageUser,
            isEdit: true,
            onClicked: () async {
              final imageResult =
                  await ImagePicker().pickImage(source: ImageSource.gallery);

              repository.updateImage(imageResult?.path ?? "", id);

              setState(() {

              });



              ///Копируем изображение
            },
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.028),
          TextFieldWidget(
            ///Строка Имени
            label: 'Полное Имя',
            maxLengthelements: 50,
            text: user?.fullName ?? "",
            onChanged: (String value) {},
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.17),

          SizedBox(height: MediaQuery.of(context).size.height * 0.3),

          ///Кнопка Save
          ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(10),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)))),
            onPressed: () async {
              Navigator.of(context).pop();
            },
            child: const SizedBox(
              height: 25,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
