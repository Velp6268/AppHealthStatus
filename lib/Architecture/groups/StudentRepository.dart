import 'package:health_status/Architecture/groups/IStudentSource.dart';

import 'Models.dart';

class StudentRepository{

  final IStudentSource local;
  final IStudentSource remote;

  StudentRepository(this.local, this.remote);

  List<Student> getAll(){
    var result = remote.getAll();

    if (result.isSuccess()){
      return result.data!;
    }
    else {
      var localResult  = local.getAll();
      if (localResult.isSuccess()){
        return localResult.data!;
      }
      else {
        throw Exception(localResult.exception);
      }
    }
  }


  //Остальные методы

}