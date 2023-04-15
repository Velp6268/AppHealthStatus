import 'package:health_status/Architecture/OldUser.dart';
import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/Architecture/auth/Models.dart';
import '../user/Models.dart';
import 'ILoginDataSource.dart';
import 'UserSession.dart';

class LoggedUserRepository{
  final ILoginDataSource _source;
  LoggedUserRepository(this._source);

  void login(String login, String pass){
    var result = _source.getByLoginAndPass(login, pass);
    if (result.isSuccess()){
      User user = result.data as User;
      LoggedUser logiddUser = new LoggedUser(user.id, "", user.role);
      UserSession.set(logiddUser); ///EXCEPTION
    }
  }




  void logout(){
    UserSession.clear();
  }



}






