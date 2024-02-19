import 'dart:convert';

import 'package:http/http.dart';
import 'package:recipes_calculator/data/models/meal_model.dart';

class MealService {
  Future<MealModel> getRandomMeal() async {
    Response response = await get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return MealModel.fromJson(data);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
