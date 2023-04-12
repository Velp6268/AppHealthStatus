import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/Architecture/profile/IProfileSource.dart';
import 'package:health_status/Architecture/profile/Models.dart';

import '../../resources/resources.dart';

class ProfileRemoteDbMock implements IProfileSource{

  final _profile = [
    Profile(
        userId: 1,
        fullName: "Максим Ночевный Юрьевич",
        group: "32Д",
        imageName: AppImages.maks,
        textHealthStatus: "Здоров"
    ),
    Profile(userId: 2,
        fullName: "Лазарев Никита Сергеевич",
        group: "32Д",
        imageName: AppImages.nikita,
        textHealthStatus: "Здоров"),
    Profile(userId: 3,
        fullName: "Комарденков Тимофей Дмитриеевич",
        group: "32Д",
        imageName: AppImages.tim,
        textHealthStatus: "Здоров"),
    Profile(userId: 4,
        fullName: "Платонов Виталий Ильич",
        group: "32Д",
        imageName: AppImages.vitalya,
        textHealthStatus: "Уехал")

  ];

  @override
  Result changeImage(String img) {
    // TODO: implement changeImage
    throw UnimplementedError();
  }

  @override
  Result changeName(String name) {
    // TODO: implement changeName
    throw UnimplementedError();
  }

  @override
  Result<Profile> getById(int id) {
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