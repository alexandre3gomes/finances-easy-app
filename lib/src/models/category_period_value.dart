import 'package:finances_easy_app/src/models/category.dart';
import 'package:finances_easy_app/src/models/period_value.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category_period_value.g.dart';

@JsonSerializable()
class CategoryPeriodValue {
  Category category;
  List<PeriodValue> periodValue;

  CategoryPeriodValue({this.category, this.periodValue});

  factory CategoryPeriodValue.fromJson(Map<String, dynamic> json) => _$CategoryPeriodValueFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryPeriodValueToJson(this);
}