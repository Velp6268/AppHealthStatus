import 'package:health_status/Architecture/profile/IProfileSource.dart';
import 'package:health_status/Architecture/profile/Models.dart';

class StatusRepository{

  final IProfileSource local;
  final IProfileSource remote;

  StatusRepository(this.remote, this.local);



//методы изменения данных профиля


}