import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:health_status/Architecture/auth/UserSession.dart';
import 'package:health_status/Architecture/profile/Models.dart';
import 'package:health_status/Architecture/profile/ProfileRepository.dart';
import 'package:health_status/Frames/Profile/Widget/ProfileWidget.dart';
import 'package:health_status/Theme/app_colors.dart';
import 'package:health_status/resources/resources.dart';
import 'package:health_status/ui/profile_btn.dart';
import 'package:health_status/Frames/Profile/ProfileEdit/ProfileEdit.dart';


import '../../Architecture/auth/LoggedUserRepository.dart';
import '../../Architecture/user/Models.dart';

class Profile extends StatefulWidget {
  final ProfileRepository repository;

  const Profile({Key? key, required this.repository})
      : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  var student;
  final id = UserSession.get()?.Id;
  _initStudent() async{

    var user = await widget.repository.getByUserId(id!);
    setState(() {
      student = user;
    });

  }


  @override
  Widget build(BuildContext context) {

    _initStudent();

    return buildScaffold(context);
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SizedBox(
          width: MediaQuery.of(context).size.width * 0.22,
          child: const FittedBox(
            fit: BoxFit.contain,
            child: Text(
              "Профиль",
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            iconSize: MediaQuery.of(context).size.height * 0.025,
            splashRadius: 20,
            icon: Icon(Icons.edit, color: Colors.black),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileEdit(repository: widget.repository,)));
            },
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ///Контейнер отвечающий за фон (Фото)
          ContainerImage(context),

          ///Виджет отвечающий за аватарку пользователя
          ProfileWidget(
            imagePath: student?.imageName ?? "",
            onClicked: () async {
              await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileEdit(repository: widget.repository)));
              setState(() {});
            },
          ),



          ///Контейнер отвечающий за Инфо-табличку
          buildInfoTable(student!),

          ///Кнопка уведомление
          ProfileButton(
            icon: AppImages.notifications,
            text: 'Уведомление',
            onClicked: () async {},
          ),

          ///Кнопка Настройки
          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.06),
            child: ProfileButton(
              icon: AppImages.settings,
              text: 'Настройки',
              onClicked: () async {},
            ),
          ),



          ///Кнопка Выйти из Аккаунта
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.03,
            child: buttonLogOut(context),
          ),
        ],
      ));
  }
  /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// ///
  SizedBox buttonLogOut(BuildContext context) {
    ///Кнопка выйти
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.04,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.red),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
        onPressed: () async {

        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.height * 0.025,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'Log out',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }




  Container buildInfoTable(ProfileUser student) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.2,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.mainGrey),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10)),
          color: AppColors.mainGrey),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        children: [
          ///1 половина Column
          buildOnePartInfoTable(student),

          ///Тонкая линия по середине таблички
          buildLine(context),

          /// 2 часть инфо-таблички (Текущий статус)
          buildTwoPartInfoTable(student),
        ],
      ),
    );
  }

  Expanded buildOnePartInfoTable(ProfileUser student) {
    return Expanded(
      ///1 Половина инфо таблички с инфой (ФИО, группа)
      flex: 100,
      child: Container(
          alignment: Alignment.center,
          padding:
          EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.025),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
                child: FittedBox(
                  ///Нужен для того что бы объект не выходил за рамки
                  fit: BoxFit.contain,
                  child: Text(
                    widget.repository.findIntialsOfFullName(student.fullName),
                      style: TextStyle(fontSize: 16),

                ),
              ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.006),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.022,
                child: FittedBox(
                  ///Нужен для того что бы объект не выходил за рамки
                  fit: BoxFit.contain,
                  child: Text('Группа: ' + student.group,
                      style: TextStyle(fontSize: 16)),
                ),
              )
            ],
          )),
    );
  }

  Expanded buildTwoPartInfoTable(ProfileUser student) {

    return Expanded(
      /// 2 половина инфо таблички(Текущий статус здоровья)
      flex: 100,
      child: Container(
        alignment: Alignment.center,
        padding:
        EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.023),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
              child: const FittedBox(
                ///Нужен для того что бы объект не выходил за рамки
                fit: BoxFit.contain,
                child: Text(
                  'Текущий статус статус: ',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Padding(
              ///Отступ "статуса здоровья" с верху
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.007),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    ///Отступ индикатора здоровья от установленного статуса здоровья
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.015),

                    ///Контейнер отвечающий за индикатор здоровья
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.018,
                      height: MediaQuery.of(context).size.width * 0.049,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: widget.repository.statusHealthy(student.textHealthStatus)
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                    child: FittedBox(
                      ///Нужен для того что бы объект не выходил за рамки
                      fit: BoxFit.contain,
                      child: Text(
                          student?.textHealthStatus ?? "",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///Отвечает за линию в инфо табличке
  Expanded buildLine(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.black87,
        ),
      ),
    );
  }

  ///ФОН Контейнер отвечающий за картинку, а так же за ее растяжку
  Container ContainerImage(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: const Image(
        fit: BoxFit.fill,
        image: AssetImage(AppImages.city),
      ),
    );
  }
}
