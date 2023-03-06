import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Group extends StatelessWidget {
  const Group({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
            title: Text("Группа",style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
          centerTitle: true,
        ),
          body:ListView(
            children: [
              _tile('Владимир Пупкин', 'Болеет', Icons.people),
              _tile('Абоба Абобович', 'Здоров', Icons.people),
              _tile('Лазарев Никита', 'Сдох нахуй', Icons.block),
              _tile('Тимофей Коморденков', 'ЕГЭ', Icons.alarm_off),
              _tile('Максим Кочевный ', 'Наелся и спит', Icons.airline_seat_individual_suite),
              _tile('Максим Ф', 'Здоров', Icons.people),
              _tile('Владимир Пупкин', 'Болеет', Icons.people),
              _tile('Абоба Абобович', 'Здоров', Icons.people),
              _tile('Лазарев Никита', 'Сдох нахуй', Icons.people),
              _tile('Тимофей Коморденков', 'ЕГЭ', Icons.people),
              _tile('Максим Кочевный ', 'Наелся и спит', Icons.airline_seat_individual_suite),
              _tile('Виталя', 'Здоров', Icons.people),
          ],
          )
      );
  }

  ListTile _tile(String title, String subtitle, IconData icon) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )),
      subtitle: Text(subtitle),
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
    );
  }
}