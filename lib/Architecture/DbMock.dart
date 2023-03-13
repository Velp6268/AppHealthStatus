import 'package:health_status/Architecture/IDataSourse.dart';
import 'package:health_status/Architecture/User.dart';
import 'package:health_status/Theme/app_colors.dart';
import 'package:health_status/resources/resources.dart';

class DbMock implements IDataSource {
  final students = [
    User(
        id: 1,
        fullName: 'Ночевный М.Ю.',
        imageName: AppImages.maks,
        healthStatus: AppColors.statusHealthy),
    User(
        id: 2,
        fullName: 'Лазарев Н.С.',
        imageName: AppImages.nikita,
        healthStatus: AppColors.statusHealthy),
    User(
        id: 3,
        fullName: 'Комарденков Т.Д.',
        imageName: AppImages.tim,
        healthStatus: AppColors.statusAnother),
    User(
        id: 4,
        fullName: 'Платонов В.И.',
        imageName: AppImages.vitalya,
        healthStatus: AppColors.statusHealthy),
    User(
        id: 4,
        fullName: 'Неизвестный Н.Н.',
        imageName: AppImages.man,
        healthStatus: AppColors.statusUnHealthy),

  ];

  @override
  void delete(User user) {
    // TODO: implement delete
  }

  @override
  User findById(int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  List<User> getAll() {
    // TODO: implement getAll
    return students;

  }

  @override
  void insert(User idUser) {
    // TODO: implement insert
  }

  @override
  void update(User user) {
    // TODO: implement update
  }
}
