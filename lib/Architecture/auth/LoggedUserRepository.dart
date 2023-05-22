import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/Architecture/auth/Models.dart';
import '../user/Models.dart';
import 'ILoginDataSource.dart';
import 'UserSession.dart';
import 'package:health_status/Architecture/ManagerToken/TokenManagmer.dart';

class LoggedUserRepository {
  bool error = false;
  final ILoginDataSource _source;

  LoggedUserRepository(this._source);

  String? textError = '';

  void login(String login, String pass) async {
    var result = await _source.getByLoginAndPass(login, pass);

    if (result.isSuccess()) {
      User user = result.data as User;
      LoggedUser logiddUser = new LoggedUser(user.id, user.email, user.username, user.role, user.token);
      TokenManager.setUserToken(user.token);

      UserSession.set(logiddUser);
      error = false;
    } else {
      textError = result.exception;
      error = true;
    }
  }

  String? errorText() {
    if (textError == true) {
      return textError;
    } else if (textError == null) {
      return textError;
    }
  }
}

void logout() {
  UserSession.clear();
}
