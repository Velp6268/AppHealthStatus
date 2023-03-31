import 'package:health_status/Architecture/User.dart';

import 'ILoginDataSource.dart';

class UserRepository{
  final ILoginDataSource _source;
  UserRepository(this._source);

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

class UserSession{
  static User? _user;
  static late Function function;
  UserSession._();

  static User? get(){
    return _user;
  }

  static void set(User user){
    _user = user;
    function(_user);
  }

  static void clear(){
    _user = null;
    function(_user);
  }
}




