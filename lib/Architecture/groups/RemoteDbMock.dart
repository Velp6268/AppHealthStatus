import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/Architecture/groups/IStudentSource.dart';
import 'package:health_status/Architecture/groups/Models.dart';
import 'package:health_status/resources/resources.dart';

class RemoteDbMock {
  final students = [
    Student(
        imageName: AppImages.maks,
        fullName: 'Ночевный Максим Юрьевич',
        textHealsStatus: 'Здоров'),
    Student(
        imageName: AppImages.nikita,
        fullName: 'Лазарев Никита Сергеевич',
        textHealsStatus: 'Здоров'),
    Student(
        imageName: AppImages.tim,
        fullName: 'Комарденков Тимофей Дмитреевич',
        textHealsStatus: 'Здоров'),
    Student(
        imageName: AppImages.vitalya,
        fullName: 'Платонов Виталий Ильич',
        textHealsStatus: 'Уехал по делам'),
  ];



}


