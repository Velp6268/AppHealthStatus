import 'package:health_status/Architecture/IDataSourse.dart';
import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/resources/resources.dart';

import 'User.dart';

class LoginRepository{

  final IDataSource dataSource;

  LoginRepository(this.dataSource);
  List<User> getAll() {
    return dataSource.getAll();
  }
  Result login(String login, String pass){
    return dataSource.getByLoginAndPass(login, pass);
  }

}