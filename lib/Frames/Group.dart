import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_status/resources/resources.dart';
import 'package:health_status/Theme/app_colors.dart';

class Group extends StatelessWidget {
  const Group({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Группы",
            style: TextStyle(fontSize: 18, color: Colors.black87)),
      ),
      body: Stack(
        children: [
          ///Лист
          ListView.builder(
            padding: const EdgeInsets.only(top: 6),
            itemCount: 10,
            itemExtent: 60,
            itemBuilder: (BuildContext context, int index) {
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
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      color: AppColors.mainGrey),
                  child: Row(
                    children: [
                      Container(
                        ///контейнер отвечающий за полоску здоровья
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(15),
                          ),
                          color: Colors.green,
                        ),
                        width: 10,
                      ),

                      ///Делаем отступ
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                      ),

                      ///Аватарка
                      const Image(
                        image: AssetImage(AppImages.man),
                        width: 44,
                        height: 44,
                      ),

                      ///Контейнер в котором хранится колонка с текстом
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(height: 18),
                              Text('Ночевный М.Ю.')
                            ],
                          ),
                        ),
                      ),

                      ///Отступ от контейнера для поинтера
                      ///
                      Expanded(
                        flex: 1,
                        child: Container(
                            padding: const EdgeInsets.only(left: 30),
                            child: const Image(
                              image: AssetImage(AppImages.pointer),
                              width: 15,
                              height: 15,
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
}
