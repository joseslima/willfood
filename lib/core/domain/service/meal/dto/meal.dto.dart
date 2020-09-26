import 'package:json_annotation/json_annotation.dart';

part 'meal.dto.g.dart';

@JsonSerializable()
class Meals {
  @JsonKey(nullable: false)
  List<Meal> meals;

  Meals({this.meals});

  factory Meals.fromJson(Map<String, dynamic> json) =>
      _$MealsFromJson(json);

  Map<String, dynamic> toJson() => _$MealsToJson(this);
}

@JsonSerializable()
class Meal {
  String idMeal;
  String strMeal;
  String strMealThumb;

  Meal({this.idMeal, this.strMeal, this.strMealThumb});

  factory Meal.fromJson(Map<String, dynamic> json) =>
      _$MealFromJson(json);

  Map<String, dynamic> toJson() => _$MealToJson(this);
}
