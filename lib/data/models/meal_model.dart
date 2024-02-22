
import 'meal.dart';

class MealModel {
  Meal meal;

  MealModel({required this.meal});

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(meal: Meal.fromJson(json['meals'][0]));
  }
}