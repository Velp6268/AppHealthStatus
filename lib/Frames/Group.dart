import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_status/Architecture/Repository.dart';
import 'package:health_status/Architecture/OldUser.dart';
import 'package:health_status/Architecture/auth/LoggedUserRepository.dart';
import 'package:health_status/Architecture/groups/Models.dart';
import 'package:health_status/Architecture/groups/StudentRepository.dart';
import 'package:health_status/resources/resources.dart';
import 'package:health_status/Theme/app_colors.dart';

class Group extends StatelessWidget {
  final StudentRepository repository;

  const Group({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 10), () {

    });
    var students = repository.getAll();


    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Группы",
              style: TextStyle(fontSize: 18, color: Colors.black87)),
          centerTitle: true),
      body: Stack(
        children: [
          ///Лист
          ListView.builder(
            padding: const EdgeInsets.only(top: 6),
            itemCount: students.length,
            itemExtent: 60,
            itemBuilder: (BuildContext context, int index) {
              final student = students[index];
              return Container(
                ///отвечает за отступы Элемента списка от краев
                padding: const EdgeInsets.fromLTRB(15, 8, 16, 0),

                child: DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.mainGrey),

                      ///Окружность краев Элемента списка
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      color: AppColors.mainGrey),
                  child: Row(
                    children: [
                      ///Метод в котором хранится Контейнер с полоской здоровья
                      buildHealthyLine(student),

                      ///Делаем отступ
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                      ),

                      ///Аватарка

                      ClipOval(
                        child: Image(
                          image: AssetImage(student.imageName),
                          width: 44,
                          height: 44,
                          fit: BoxFit.fitWidth,
                        ),
                      ),

                      ///Контейнер в котором хранится колонка с текстом
                      buildFullName(student),

                      ///Отступ от контейнера для стрелочки и сама стрелочка
                      Expanded(
                        flex: 1,
                        child: Container(
                            padding: const EdgeInsets.only(left: 45),
                            child: const Image(
                              image: AssetImage(AppImages.pointer),
                              width: 14,
                              height: 14,
                            )),
                      ),

                      ///Картинка указателя
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  ///контейнер отвечающий за полоску здоровья
  Container buildHealthyLine(Student student) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(10),
        ),
        color: repository.statusHealthy(student.textHealsStatus)
      ),
      width: 10,
    );
  }

  ///Контейнер отвечающий за Имя
  Expanded buildFullName(Student student) {
    return Expanded(
      flex: 3,
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [SizedBox(height: 18), Text(repository.findIntialsOfFullName(student.fullName))],
        ),
      ),
    );
  }
}
