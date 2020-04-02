import 'package:finances_easy_app/src/models/category.dart';
import 'package:finances_easy_app/src/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'expense.g.dart';

@JsonSerializable()
class Expense {

  int id;
  Category category;
  User user;
  String name;
  double value;
  String expireAt;
  String description;

  Expense(
      {this.id,
      this.category,
      this.user,
      this.name,
      this.value,
      this.expireAt,
      this.description});

  factory Expense.fromJson(Map<String, dynamic> json) => _$ExpenseFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseToJson(this);
}
