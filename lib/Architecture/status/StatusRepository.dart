import 'package:health_status/Architecture/profile/IProfileSource.dart';
import 'package:health_status/Architecture/profile/Models.dart';
import 'package:health_status/Architecture/status/IStatusSource.dart';

import 'Models.dart';

class StatusRepository{

  final IStatusSource remote;

  StatusRepository(this.remote);

  Status? getByUserId(int userId){

    var remoteResult = remote.getByUserId(userId);
    if(remoteResult.isSuccess()){
      return remoteResult.data!;
    }
  }

//методы изменения данных профиля


}