import 'package:health_status/Architecture/profile/IProfileSource.dart';
import 'package:health_status/Architecture/profile/Models.dart';
import 'package:health_status/Architecture/status/IStatusSource.dart';

import 'Models.dart';

class StatusRepository{

  final IStatusSource remote;

  StatusRepository(this.remote);



  Future<Status?> getByUserId(int id, String token) async{

    var remoteResult = await remote.getByUserId(id, token);
    if(remoteResult.isSuccess()){
      return remoteResult.data!;
    }
  }


  Future<Status> changeStatusHealthy(int idNewStatus, int id, String token) async{
    var remoteResult = await remote.changeStatusHealthy(idNewStatus, id, token);

    return remoteResult.data!;
  }


//методы изменения данных профиля


}