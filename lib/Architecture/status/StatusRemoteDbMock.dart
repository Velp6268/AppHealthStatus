import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/Architecture/status/IStatusSource.dart';
import 'package:health_status/Architecture/status/Models.dart';

import '../../resources/resources.dart';

class StatusRemoteDbMock implements IStatusSource{

  final _userStatus = [
    Status(
        id: 1,
        imageName: AppImages.maks,
        textHealthStatus: "Я здоров"
    ),
    Status(
        id: 2,
        imageName: AppImages.nikita,
        textHealthStatus: "Я здоров"
    ),
    Status(
        id: 3,
        imageName: "/data/user/0/com.example.health_status/cache/96b847cc-9509-4e02-b382-c7adbc2ef115/sasuke.png",
        textHealthStatus: 'Я здоров'
    ),
    Status(
        id: 4,
        imageName: AppImages.vitalya,
        textHealthStatus: "Я уехал"
    ),

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
  Result getByUserId(int userId) {
    try {
      var result = _userStatus.firstWhere(
              (element) => element.id == userId);
      return Result.success(result);
    } on StateError {
      return Result.error("Такого статуса нет");
    }
  }

}