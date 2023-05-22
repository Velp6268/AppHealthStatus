import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_status/Architecture/groups/Models.dart';
import 'package:health_status/Architecture/groups/StudentRepository.dart';
import 'package:health_status/resources/resources.dart';
import 'package:health_status/Theme/app_colors.dart';

import '../../Architecture/ManagerToken/TokenManagmer.dart';


class GroupUserView extends StatefulWidget {

  final StudentRepository repository;

  const GroupUserView({Key? key, required this.repository}) : super(key: key);

  @override
  State<GroupUserView> createState() => _GroupUserViewState();
}

class _GroupUserViewState extends State<GroupUserView> {

  List<Student> students = List.empty();

  _initStudents() async {
    final token = await TokenManager.getUserToken();
    var list = await widget.repository.getAll(token!);
    setState(() {
      students = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    _initStudents();
    return buildScaffold(context, students);
  }


  Scaffold buildScaffold(BuildContext context, List<Student> students) {
    return Scaffold(
      appBar: initAppbar(context),
      body: Stack(
        children: [
          ///Лист
          createList(students),
        ],
      ),
    );
  }

  ListView createList(List<Student> students) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 6),
      itemCount: students.length,
      itemExtent: 60,
      itemBuilder: (BuildContext context, int index) {
        final student = students[index];
        return _createListBody(student);
      },
    );
  }

  Container _createListBody(Student student) {
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
                image: NetworkImage(student.imageName),
                width: 44,
                height: 44,
                fit: BoxFit.cover,
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
  }

  AppBar initAppbar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('Группы',
          style: TextStyle(fontSize: 18, color: Colors.black87)),
      centerTitle: true,
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        print('Кликнуть на Управление группой');
        break;
      case 1:
        print('Кликнуть на Скачать список');
        break;
    }
  }

  ///контейнер отвечающий за полоску здоровья
  Container buildHealthyLine(Student student) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(10),
          ),
          color: widget.repository.statusHealthy(student.textHealthStatus)),
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
          children: [
            SizedBox(height: 18),
            Text(widget.repository.findIntialsOfFullName(student.fullName))
          ],
        ),
      ),
    );
  }
}

