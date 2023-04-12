import '../OldUser.dart';
import 'Models.dart';

class UserSession{
  static LoggedUser? _user;
  static late Function function;
  UserSession._();

  static LoggedUser? get(){
    return _user;
  }

  static void set(LoggedUser user){
    _user = user;
    function(_user);
  }

  static void clear(){
    _user = null;
    function(_user);
  }

}