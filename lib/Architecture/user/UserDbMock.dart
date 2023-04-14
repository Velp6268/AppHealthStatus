import 'package:health_status/Architecture/Result.dart';

import 'package:health_status/Architecture/user/Models.dart';

import '../auth/ILoginDataSource.dart';

class UserDbMock implements ILoginDataSource{

  final _user = [
    User(
        id: 1,
        login: "maks",
        pass: "1111",
        role: 1),
    User(id: 2,
        login: "nikita",
        pass: "1111",
        role: 1),
    User(id: 3,
        login: "tim",
        pass: "1111",
        role: 1),
    User(id: 5,
        login:"vit",
        pass: "1111",
        role: 1)
  ];

  Result getById(int id) {
    try {
      var result = _user.firstWhere(
              (element) => element.id == id);
      return Result.success(result);
    } on StateError {
      return Result.error("Id not found");
    }
  }

  Result getByLoginAndPass(String login, String pass) {

    try {
      var result = _user.firstWhere(
              (element) => element.login == login && element.pass == pass);
      return Result.success(result);
    } on StateError {
      return Result.error("Логин или пароль не верны");
    }
  }

  @override
  Result login(String login, String pass) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }


}