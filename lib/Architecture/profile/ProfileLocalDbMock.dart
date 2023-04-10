import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/Architecture/profile/IProfileSource.dart';
import 'package:health_status/Architecture/profile/Models.dart';
import 'package:health_status/resources/resources.dart';

class ProfileLocalDbMock implements IProfileSource{

  final profile = [
    Profile(
      userId: 1,
      fullName: "Максим Ночевный Юрьевич",
      group: "32Д",
      imageName: AppImages.maks,
      textHealthStatus: "Здоров"
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
  Result<Profile> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }


}