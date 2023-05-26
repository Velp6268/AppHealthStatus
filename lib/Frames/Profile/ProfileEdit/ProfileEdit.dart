import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_status/Architecture/auth/LoggedUserRepository.dart';
import 'package:health_status/Architecture/auth/UserSession.dart';
import 'package:health_status/Architecture/profile/Models.dart';
import 'package:health_status/Architecture/profile/ProfileRepository.dart';
import 'package:health_status/Frames/Profile/Widget/ProfileWidget.dart';
import 'package:health_status/Frames/Profile/OtherWidgets/TextFieldWidget.dart';
import 'package:health_status/Theme/app_colors.dart';
import 'package:health_status/resources/resources.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import '../../../Architecture/ManagerToken/TokenManagmer.dart';
import '../../../main_screen_widget.dart';

class ProfileEdit extends StatefulWidget {
  final ProfileRepository repository;

  const ProfileEdit({Key? key, required this.repository}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  var nameUser;
  var user;
  var token;
  final id = UserSession.get()?.id;

  _initUser() async{
    final userToken = await TokenManager.getUserToken();
    var student = await widget.repository.getByUserId(id!, userToken!);
    var nameUser = student!.fullName;
    setState(() {
      token = userToken;
      user = student;
      this.nameUser = nameUser;
    });
  }


  @override
  void initState() {
    super.initState();
    _initUser();
  }

  @override
  Widget build(BuildContext context) {


    if(user == null){
      return Container(
        color: Colors.white, // Задний фон цвета белого
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }else{
      final imageUser = user?.imageName ?? AppImages.man;
      return buildScaffold(imageUser, context, token, user);
    }
  }

  Scaffold buildScaffold(imageUser, BuildContext context, String token, ProfileUser user) {
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

            widget.repository.updateImage(imageResult?.path ?? "", id!, token);

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

          text: nameUser,
          onChanged: (String value) {

            nameUser = value;



          },
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
            await Future.delayed(Duration(seconds: 2)).then((_) {
              widget.repository.remote.changeName(nameUser, id!, token);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainScreenWidget(selectedTab: 2)),
              );
            });
            setState(() {

            });
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
