
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_status/Architecture/auth/UserRepository.dart';
import 'package:health_status/Frames/Profile/Widget/ProfileWidget.dart';
import 'package:health_status/Architecture/Repository.dart';
import 'package:health_status/Frames/Profile/OtherWidgets/TextFieldWidget.dart';
import 'package:health_status/Theme/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class ProfileEdit extends StatefulWidget {
  final LoginRepository repository;

  const ProfileEdit({Key? key, required this.repository}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState(repository);
}

class _ProfileEditState extends State<ProfileEdit> {

  var user;
  _ProfileEditState(this.repository);
  final LoginRepository repository;

  void initState(){
    super.initState();

    user = repository.getUser();
  }

  @override
  Widget build(BuildContext context) {




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
              imagePath: user!.imageName,
              isEdit: true,
              onClicked: () async {
               final image = await ImagePicker().pickImage(source: ImageSource.gallery);

               if(image == null) return;

               final directory = await getApplicationDocumentsDirectory(); ///Сохраняем в катологе фото в документах
               final name = basename(image.path); ///поллучаем имя файла и формат
               final imageFile = File('${directory.path}/$name'); ///Создаем файл изображения
               final newImage =
                  await File(image.path).copy(imageFile.path); ///Копируем изображение

                setState(()=> user = user?.copy(imageName: newImage.path));



              },
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.028),
            TextFieldWidget(
              ///Строка Имени
              label: 'Полное Имя',
              maxLengthelements: 50,
              text: user!.fullName,
              onChanged: (name) => user = user!.copy(fullName: name),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.17),


            SizedBox(height: MediaQuery.of(context).size.height * 0.3),

            ///Кнопка Save
               ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(10),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                )),
                onPressed: () async {
                  repository.setUser(user!);
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
