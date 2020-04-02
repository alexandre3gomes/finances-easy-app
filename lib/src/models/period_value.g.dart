// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeriodValue _$PeriodValueFromJson(Map<String, dynamic> json) {
  return PeriodValue(
    startDate: json['startDate'] as String,
    endDate: json['endDate'] as String,
    plannedValue: json['plannedValue'] as int,
    actualValue: json['actualValue'] as int,
  );
}

Map<String, dynamic> _$PeriodValueToJson(PeriodValue instance) =>
    <String, dynamic>{
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'plannedValue': instance.plannedValue,
      'actualValue': instance.actualValue,
    };
