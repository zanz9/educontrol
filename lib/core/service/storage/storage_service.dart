import 'package:educontrol/core/service/models/student.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageService {
  Future<void> saveString(String key, String value);
  String? getString(String key);

  Future<void> saveStudent(Student student);
  Future<Student?> getStudent(String id);
  Future<List<Student>> getStudents();
}

@Injectable(as: StorageService)
class StorageServiceImpl implements StorageService {
  final SharedPreferences _sharedPreferences;
  final FirebaseDatabase database;

  StorageServiceImpl(this._sharedPreferences, this.database);

  @override
  Future<void> saveString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  @override
  String? getString(String key) {
    return _sharedPreferences.getString(key);
  }

  @override
  Future<void> saveStudent(Student student) async {
    if (student.id == null) {
      final ref = database.ref('students');
      final newRef = ref.push();
      student = student.copyWith(id: newRef.key!);
      await newRef.set(student.toJson());
    } else {
      final ref = database.ref('students/${student.id}');
      await ref.set(student.toJson());
    }
  }

  @override
  Future<List<Student>> getStudents() async {
    final ref = database.ref('students');
    final snapshot = await ref.get();
    final studentsMap = snapshot.value as Map<Object?, Object?>?;
    if (studentsMap == null) return [];
    return studentsMap.entries
        .map((e) => Student.fromJson({
              ...e.value as Map<Object?, Object?>,
              'id': e.key,
            }.map((key, value) => MapEntry(key.toString(), value))))
        .toList();
  }

  @override
  Future<Student?> getStudent(String id) async {
    final ref = database.ref('students/$id');
    final snapshot = await ref.get();
    final student = snapshot.value as Map<String, dynamic>;
    return Student.fromJson(student);
  }
}
