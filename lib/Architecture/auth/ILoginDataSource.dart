import '../Result.dart';

abstract class ILoginDataSource{
  Result login(String login, String pass);
  logout();
}