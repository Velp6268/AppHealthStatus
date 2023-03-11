import 'package:health_status/Architecture/IDataSourse.dart';

import 'User.dart';

class Repository{

  final IDataSource dataSource;

  Repository(this.dataSource);

  List<User> getAll(){
    return dataSource.getAll();
  }

}