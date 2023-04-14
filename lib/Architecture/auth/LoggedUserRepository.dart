import 'package:health_status/Architecture/OldUser.dart';
import 'package:health_status/Architecture/Result.dart';
import 'ILoginDataSource.dart';
import 'UserSession.dart';

class LoggedUserRepository{
  final ILoginDataSource _source;
  LoggedUserRepository(this._source);

  void login(String login, String pass){
    var result = _source.getByLoginAndPass(login, pass);
    if (result.isSuccess()){
      UserSession.set(result.data); ///EXCEPTION
    }
  }



  void logout(){
    UserSession.clear();
  }

}






