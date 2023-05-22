import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/Architecture/profile/Models.dart';

abstract class IProfileSource{
  Result<ProfileUser> getById(int id, String token);
  Future <Result> changeName(String name, int id, String token);
  Future<Result> changeImage(String img, int id, String token);
  Future <Result> getByUserId(int userId, String token);

  // и тд
}