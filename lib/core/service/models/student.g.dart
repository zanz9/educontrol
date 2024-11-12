// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentImpl _$$StudentImplFromJson(Map<String, dynamic> json) =>
    _$StudentImpl(
      id: json['id'] as String?,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      surName: json['surName'] as String,
      birthday: DateTime.parse(json['birthday'] as String),
      phone: json['phone'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
      groupId: json['groupId'] as String,
    );

Map<String, dynamic> _$$StudentImplToJson(_$StudentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'surName': instance.surName,
      'birthday': instance.birthday.toIso8601String(),
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'groupId': instance.groupId,
    };
