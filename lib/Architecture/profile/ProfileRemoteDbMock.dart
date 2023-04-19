import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/Architecture/profile/IProfileSource.dart';
import 'package:health_status/Architecture/profile/Models.dart';

import '../../resources/resources.dart';

class ProfileRemoteDbMock implements IProfileSource{

  final _profile = [
    ProfileUser(
        userId: 1,
        fullName: "Максим Ночевный Юрьевич",
        group: "32Д",
        imageName: AppImages.maks,
        textHealthStatus: "Я здоров"
    ),
    ProfileUser(
        userId: 2,
        fullName: "Лазарев Никита Сергеевич",
        group: "32Д",
        imageName: AppImages.nikita,
        textHealthStatus: "Я здоров"),
    ProfileUser(
        userId: 3,
        fullName: "Комарденков Тимофей Дмитриеевич",
        group: "32Д",
        imageName: "/data/user/0/com.example.health_status/cache/96b847cc-9509-4e02-b382-c7adbc2ef115/sasuke.png",
        textHealthStatus: "Я болен"),
    ProfileUser(
        userId: 4,
        fullName: "Платонов Виталий Ильич",
        group: "32Д",
        imageName: AppImages.vitalya,
        textHealthStatus: "Уехал")

  ];

  @override
  Result changeImage(String img, int id) {
    var result = _profile.firstWhere(
            (p) => p.userId == id);
    result.imageName = img;
    return Result.success(result);
  }

  @override
  Result changeName(String name) {
    // TODO: implement changeName
    throw UnimplementedError();
  }

  @override
  Result<ProfileUser> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Result getByUserId(int userId) {
    try {
      var result = _profile.firstWhere(
              (element) => element.userId == userId);
      return Result.success(result);
    } on StateError {
      return Result.error("Такого профиля нет");
    }
  }


}