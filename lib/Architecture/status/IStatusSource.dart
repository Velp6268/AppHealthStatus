import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/Architecture/profile/Models.dart';

abstract class IStatusSource{
  Future <Result> changeStatusHealthy(int idNewStatus, int id, String token);
  Future <Result> getByUserId(int userId, String token);

// и тд
}