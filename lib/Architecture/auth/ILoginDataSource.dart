import '../Result.dart';

abstract class ILoginDataSource{
  Result getByLoginAndPass(String login, String pass);
  Result getById(int id);
  logout();
}