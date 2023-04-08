import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/Architecture/profile/Models.dart';

abstract class IProfileSource{
  Result<Profile> getById(int id);
  Result changeName(String name);
  Result changeImage(String img);

  // и тд
}