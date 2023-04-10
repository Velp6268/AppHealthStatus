import 'package:health_status/Architecture/profile/IProfileSource.dart';
import 'package:health_status/Architecture/profile/Models.dart';

class ProfileRepository{

  final IProfileSource local;
  final IProfileSource remote;

  ProfileRepository(this.local, this.remote);


  Profile getById(int id){
    var local = remote.getById(id);
    if (local.isSuccess()){
      return local.data!;
    }
    else{
      var remoteResult = remote.getById(id);
      if (remoteResult.isSuccess()){
        return remoteResult.data!;
      }
      else{
        throw Exception(remoteResult.exception);
      }
    }
  }

  //методы изменения данных профиля


}