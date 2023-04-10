import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/Architecture/status/IStatusSource.dart';

class StatusLocalDbMock implements IStatusSource{
  @override
  Result changeImage(String img) {
    // TODO: implement changeImage
    throw UnimplementedError();
  }

  @override
  Result changeName(String name) {
    // TODO: implement changeName
    throw UnimplementedError();
  }

}