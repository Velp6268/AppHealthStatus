import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_status/Architecture/User.dart';
import 'package:health_status/Frames/ProfileWidget.dart';
import 'package:health_status/Theme/app_colors.dart';
import 'package:health_status/resources/resources.dart';
import 'package:health_status/ui/profile_btn.dart';
import 'package:health_status/Frames/ProfileEdit.dart';
import 'package:health_status/Architecture/Repository.dart';
import 'package:health_status/Architecture/DbMock.dart';




class Profile extends StatefulWidget {

  final Repository repository;

  const Profile({Key? key, required this.repository}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState(repository);
}

class _ProfileState extends State<Profile> {

  final Repository repository;

  _ProfileState(this.repository);



  _changeProfile() {
    setState(() {
      print('');
    });
  }



  @override
  Widget build(BuildContext context) {

    final student = repository.getAll().first;
    final statusStudent = repository.statusHealthyText(student);

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
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileEdit(repository: Repository(DbMock()))));
            },
          ),
          ],
        ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [





            ///Контейнер отвечающий за фон (Фото)
            ContainerImage(context),

            ProfileWidget(
              imagePath: student.imageName,
              onClicked: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileEdit(repository: Repository(DbMock()))));
              },
            ),




            ///Контейнер отвечающий за Инфо-табличку
            buildInfoTable(student, statusStudent),



            ///Кнопка уведомление
            ProfileButton(
                icon: AppImages.notifications,
                text: 'Уведомление',
                onClick: _changeProfile()),

            ///Кнопка Настройки
            Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.06),
                child: ProfileButton(
                    icon: AppImages.settings,
                    text: 'Настройки',
                    onClick: _changeProfile())),

            ///Кнопка Помощь
            Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.12),
                child: ProfileButton(
                    icon: AppImages.man,
                    text: 'Помощь',
                    onClick: _changeProfile()))
          ],
        ));
  }

  /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// ///

  Container buildAvatarka(User student) {
    return Container(
      ///Аватарка
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.032),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.15,
        child: FittedBox(
          ///Нужен для того что бы объект не выходил за рамки
          fit: BoxFit.contain,

          ///возможность максимального масштабирования без выхода за границы виджета.
          child: ClipOval(
            child: Image(
              image: AssetImage(student.imageName),
              width: 150,
              height: 150,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }

  Container buildInfoTable(User student, String statusStudent) {
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
          buildTwoPartInfoTable(student, statusStudent),
        ],
      ),
    );
  }

  Expanded buildOnePartInfoTable(User student) {
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
                    student.user_name,
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
                  child: Text('Группа: ' + student.group,style: TextStyle(fontSize: 16)),
                ),
              )
            ],
          )),
    );
  }

  Expanded buildTwoPartInfoTable(User student, String statusStudent) {
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
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: student.healthStatus
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                    child: FittedBox(
                      ///Нужен для того что бы объект не выходил за рамки
                      fit: BoxFit.contain,
                      child: Text(
                        statusStudent,
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

