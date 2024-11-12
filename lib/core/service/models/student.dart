import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';
part 'student.g.dart';

@freezed
class Student with _$Student {
  const factory Student({
    String? id,
    required String firstName,
    required String lastName,
    required String surName,
    required DateTime birthday,
    required String phone,
    required String email,
    required String address,
    required String groupId,
  }) = _Student;

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
}
