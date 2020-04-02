// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Income _$IncomeFromJson(Map<String, dynamic> json) {
  return Income(
    id: json['id'] as int,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    name: json['name'] as String,
    value: json['value'] as int,
    date: json['date'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$IncomeToJson(Income instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'name': instance.name,
      'value': instance.value,
      'date': instance.date,
      'description': instance.description,
    };
