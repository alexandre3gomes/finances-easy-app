// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_period_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryPeriodValue _$CategoryPeriodValueFromJson(Map<String, dynamic> json) {
  return CategoryPeriodValue(
    category: json['category'] == null
        ? null
        : Category.fromJson(json['category'] as Map<String, dynamic>),
    periodValue: (json['periodValue'] as List)
        ?.map((e) =>
            e == null ? null : PeriodValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CategoryPeriodValueToJson(
        CategoryPeriodValue instance) =>
    <String, dynamic>{
      'category': instance.category,
      'periodValue': instance.periodValue,
    };
