import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_calculator/services/meal_service.dart';

import '../data/models/meal_model.dart';

class MealsController extends GetxController {
  MealService mealService = MealService();

  Future<List<MealModel>> fetchMeals(int numberOfRandomMeals) async {
    List<MealModel> meals = [];

    for (int i = 0; i < numberOfRandomMeals; i++) {
      final meal = await mealService.getRandomMeal();
      meals.add(meal);
    }
    return meals;
  }
}
