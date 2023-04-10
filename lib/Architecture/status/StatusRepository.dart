import 'package:health_status/Architecture/profile/IProfileSource.dart';
import 'package:health_status/Architecture/profile/Models.dart';
import 'package:health_status/Architecture/status/IStatusSource.dart';

class StatusRepository{

  final IStatusSource local;
  final IStatusSource remote;

  StatusRepository(this.local, this.remote);



//методы изменения данных профиля


}