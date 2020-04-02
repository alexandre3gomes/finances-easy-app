import 'package:finances_easy_app/src/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'income.g.dart';

@JsonSerializable()
class Income {
  int id;
  User user;
  String name;
  int value;
  String date;
  String description;

  Income(
      {this.id, this.user, this.name, this.value, this.date, this.description});

  factory Income.fromJson(Map<String, dynamic> json) => _$IncomeFromJson(json);

  Map<String, dynamic> toJson() => _$IncomeToJson(this);
}
