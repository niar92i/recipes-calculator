import 'package:flutter/material.dart';
import 'package:recipes_calculator/controllers/meals_controller.dart';
import '../data/models/meal_model.dart';
import 'meal_list_page.dart';

class MealsPage extends StatelessWidget {
  MealsPage({super.key});

  MealsController recipesController = MealsController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: recipesController.fetchMeals(20),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.purple, Colors.blue],
                )),
                child: const Center(
                  child: Text('erreur'),
                ),
              );
            }
            List<MealModel> meals = snapshot.data!;
            return MealListPage(meals: meals);
          } else {
            return Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purple, Colors.blue],
              )),
              child: const Center(
                child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
              ),
            );
          }
        });
  }
}
