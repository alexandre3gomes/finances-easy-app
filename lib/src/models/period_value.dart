import 'package:json_annotation/json_annotation.dart';

part 'period_value.g.dart';

@JsonSerializable()
class PeriodValue {
  String startDate;
  String endDate;
  int plannedValue;
  int actualValue;

  PeriodValue(
      {this.startDate, this.endDate, this.plannedValue, this.actualValue});

  factory PeriodValue.fromJson(Map<String, dynamic> json) => _$PeriodValueFromJson(json);

  Map<String, dynamic> toJson() => _$PeriodValueToJson(this);
}