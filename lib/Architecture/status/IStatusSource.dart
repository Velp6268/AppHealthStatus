import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/Architecture/profile/Models.dart';

abstract class IStatusSource{
  Result changeName(String name);
  Result changeImage(String img);

// и тд
}