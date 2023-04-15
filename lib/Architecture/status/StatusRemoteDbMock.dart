import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/Architecture/status/IStatusSource.dart';
import 'package:health_status/Architecture/status/Models.dart';

import '../../resources/resources.dart';

class StatusRemoteDbMock implements IStatusSource{

  final _userStatus = [
    Status(
        1,
        AppImages.maks,
        "Я здоров"
    ),
    Status(
        2,
        AppImages.nikita,
        "Я здоров"
    ),
    Status(
        3,
        AppImages.tim,
        "Я болен"
    ),
    Status(
        4,
        AppImages.vitalya,
        "Я уехал"
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
              (element) => element.userId == userId);
      return Result.success(result);
    } on StateError {
      return Result.error("Такого статуса нет");
    }
  }

}