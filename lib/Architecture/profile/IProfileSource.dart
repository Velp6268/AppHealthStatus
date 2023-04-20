import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/Architecture/profile/Models.dart';

abstract class IProfileSource{
  Result<ProfileUser> getById(int id);
  Result changeName(String name, int id);
  Result changeImage(String img, int id);
  Result getByUserId(int userId);

  // и тд
}