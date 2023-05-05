import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_status/Architecture/groups/Models.dart';
import 'package:health_status/Architecture/groups/StudentRepository.dart';
import 'package:health_status/resources/resources.dart';
import 'package:health_status/Theme/app_colors.dart';


class GroupAdminView extends StatefulWidget {

  final StudentRepository repository;

  const GroupAdminView({Key? key, required this.repository}) : super(key: key);

  @override
  State<GroupAdminView> createState() => _GroupAdminViewState();
}

class _GroupAdminViewState extends State<GroupAdminView> {

  List<Student> students = List.empty();

  _initStudents() async {
    var list = await widget.repository.getAll();
    setState(() {
      students = list;
    });
  }

  @override
  Widget build(BuildContext context) {

    _initStudents();
    return buildScaffold(context, students, );
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
            final studentImage = student.imageName;
            final image = studentImage.contains('https://')
                ? NetworkImage(studentImage)
                : AssetImage(studentImage);
            return _createListBody(student, image);
          },
        );
  }

  Container _createListBody(Student student, final image) {
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
                    child: Ink.image(
                      image: image as ImageProvider,
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
  }

  AppBar initAppbar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('Группы',
          style: TextStyle(fontSize: 18, color: Colors.black87)),
      centerTitle: true,
      actions: [
        Theme(

          data: Theme.of(context).copyWith(

              iconTheme: const IconThemeData(color: AppColors.iconColor)
          ),
          child: PopupMenuButton<int>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) =>
            [
              PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: [
                    Icon(Icons.settings,
                        color: Colors.black,
                        size: MediaQuery
                            .of(context)
                            .size
                            .height * 0.022),
                    SizedBox(width: MediaQuery
                        .of(context)
                        .size
                        .height * 0.01),
                    Text('Управление  группой')
                  ],
                ),
              ),
              PopupMenuDivider(),
              PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: [
                    ImageIcon(
                      AssetImage(AppImages.downloadIcon),
                      color: Colors.black,
                      size: MediaQuery
                          .of(context)
                          .size
                          .height * 0.022,
                    ),
                    SizedBox(width: MediaQuery
                        .of(context)
                        .size
                        .height * 0.01),
                    Text('Скачать список')
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
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
          color: widget.repository.statusHealthy(student.textHealsStatus)),
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

