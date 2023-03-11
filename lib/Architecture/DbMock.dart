import 'package:health_status/Architecture/IDataSourse.dart';
import 'package:health_status/Architecture/User.dart';

class DbMock implements IDataSource{
  @override
  void delete(User user) {
    // TODO: implement delete
  }

  @override
  User findById(int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  List<User> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  void insert(User idUser) {
    // TODO: implement insert
  }

  @override
  void update(User user) {
    // TODO: implement update
  }

}