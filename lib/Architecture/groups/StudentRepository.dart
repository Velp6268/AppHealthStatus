import 'dart:ui';

import 'package:health_status/Architecture/groups/IStudentSource.dart';

import '../../Theme/app_colors.dart';
import 'Models.dart';

class StudentRepository{

  final IStudentSource remote;

  StudentRepository(this.remote);

  Future<List<Student>> getAll() async {
    var result = await remote.getAll();
    if (result.isSuccess()){
      return result.data!;
    }
      else {
        throw Exception(result.exception);
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


//Остальные методы

}