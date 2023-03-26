import 'package:health_status/Architecture/IDataSourse.dart';
import 'package:health_status/Architecture/User.dart';
import 'package:health_status/Theme/app_colors.dart';
import 'package:health_status/resources/resources.dart';


class DbMock implements IDataSource {
  final students = [
    User(
        id: 1,
        fullName: 'Ночевный М.Ю.',
        email: 'bagor6268@gmail.com',
        imageName: AppImages.maks,
        healthStatus: AppColors.statusHealthy,
        group: '32Д',
    ),
    User(
        id: 2,
        fullName: 'Лазарев Н.С.',
        email: 'lazurich@gmail.com',
        imageName: AppImages.nikita,
        healthStatus: AppColors.statusHealthy,
        group: '32Д',
    ),

    User(
        id: 3,
        fullName: 'Комарденков Т.Д.',
        email: 'kamardenkov@gmail.com',
        imageName: AppImages.tim,
        healthStatus: AppColors.statusAnother,
        group: '32Д',
    ),
    User(
        id: 4,
        fullName: 'Платонов В.И.',
        email: 'Platonov@gmail.com',
        imageName: AppImages.vitalya,
        healthStatus: AppColors.statusHealthy,
        group: '32Д',
    ),
    User(
        id: 4,
        fullName: 'Неизвестный Н.Н.',
        email: 'noname228@gmail.com',
        imageName: AppImages.man,
        healthStatus: AppColors.statusUnHealthy,
        group: '32Д',
    ),

  ];

  @override
  String statusHealthyText(User user ){

    if(user.healthStatus == AppColors.statusHealthy){
      return'Здооров';
    }
    if(user.healthStatus == AppColors.statusUnHealthy){
      return 'Не здоров';
    }
    if(user.healthStatus == AppColors.statusAnother){
      return 'Отсуствует по обстоятельствам';
    }

    return '';
  }

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
