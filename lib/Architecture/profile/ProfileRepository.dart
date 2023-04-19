import 'dart:ui';

import 'package:health_status/Architecture/profile/IProfileSource.dart';
import 'package:health_status/Architecture/profile/Models.dart';

import '../../Theme/app_colors.dart';

class ProfileRepository{


  final IProfileSource remote;

  ProfileRepository( this.remote);


  ProfileUser getById(int id){

      var remoteResult = remote.getById(id);
      if (remoteResult.isSuccess()){
        return remoteResult.data!;
      }
      else{
        throw Exception(remoteResult.exception);
      }
    }

    ProfileUser updateImage(String img, int id){
    var remoteResult = remote.changeImage(img, id);

        return remoteResult.data!;


    }



  ProfileUser? getByUserId(int userId){

      var remoteResult = remote.getByUserId(userId);
      if(remoteResult.isSuccess()){
        return remoteResult.data!;
      }
    }




  Color statusHealthy(String? textHealthy){
    if(textHealthy == "Я здоров")
      return AppColors.statusHealthy;
    else if(textHealthy == "Я болен")
      return AppColors.statusUnHealthy;
    else
      return AppColors.statusAnother;
  }

  String findIntialsOfFullName(String fullName) {
    String sername, name, midleName, result;

    var listWordsName = fullName.split(" ");

    sername = listWordsName[0];
    name = listWordsName[1].substring(0, 1) + ".";
    midleName = listWordsName[2].substring(0, 1) + ".";

    result = sername + " " + name + midleName;

    return result;
  }
  //методы изменения данных профиля


}