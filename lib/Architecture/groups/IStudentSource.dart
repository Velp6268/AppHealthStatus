import '../Result.dart';
import 'Models.dart';

abstract class IStudentSource{
  Result<List<Student>> getAll();
  Result<List<Student>> getByGroupId(int id);
  Result<Student> getById(int id);
  Result<Student> insert(Student student);
  Result<Student> delete(Student student);
  Result<Student> update(Student student);
}