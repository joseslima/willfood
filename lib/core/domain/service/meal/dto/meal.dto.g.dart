// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meals _$MealsFromJson(Map<String, dynamic> json) {
  return Meals(
    meals: (json['meals'] as List)
        .map((e) => Meal.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MealsToJson(Meals instance) => <String, dynamic>{
      'meals': instance.meals,
    };

Meal _$MealFromJson(Map<String, dynamic> json) {
  return Meal(
    idMeal: json['idMeal'] as String,
    strMeal: json['strMeal'] as String,
    strMealThumb: json['strMealThumb'] as String,
  );
}

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'idMeal': instance.idMeal,
      'strMeal': instance.strMeal,
      'strMealThumb': instance.strMealThumb,
    };
