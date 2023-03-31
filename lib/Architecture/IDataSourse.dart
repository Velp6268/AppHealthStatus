import 'package:health_status/Architecture/Result.dart';

import 'User.dart';

abstract class IDataSource{

  void insert(User user);
  User findById(int id);
  void delete(User user);
  void update(User user);
  List<User> getAll();
  Result getByLoginAndPass(String login, String pass);
}