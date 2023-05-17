import '../Result.dart';

abstract class ILoginDataSource{
  Future<Result>getByLoginAndPass(String login, String pass);
  Result getById(int id);
  logout();
}