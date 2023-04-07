import 'package:health_status/Architecture/User.dart';

import 'ILoginDataSource.dart';
import 'UserSession.dart';

class LoggedUserRepository{
  final ILoginDataSource _source;
  LoggedUserRepository(this._source);

  void login(String login, String pass){
    var result = _source.login(login, pass);
    if (result.isSuccess()){
      UserSession.set(result.data);
    }
  }

  void logout(){
    UserSession.clear();
  }

}






