import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/Architecture/profile/Models.dart';

abstract class IProfileSource{
  Result<ProfileUser> getById(int id);
  Future <Result> changeName(String name, int id);
  Future<Result> changeImage(String img, int id);
  Future <Result> getByUserId(int userId);

  // и тд
}