// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Expense _$ExpenseFromJson(Map<String, dynamic> json) {
  return Expense(
    id: json['id'] as int,
    category: json['category'] == null
        ? null
        : Category.fromJson(json['category'] as Map<String, dynamic>),
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    name: json['name'] as String,
    value: (json['value'] as num)?.toDouble(),
    expireAt: json['expireAt'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$ExpenseToJson(Expense instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'user': instance.user,
      'name': instance.name,
      'value': instance.value,
      'expireAt': instance.expireAt,
      'description': instance.description,
    };
