import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_calculator/data/models/meal_model.dart';

class MealDetailsPage extends StatelessWidget {
  const MealDetailsPage({super.key, required this.mealModel});

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.purple, Colors.blue],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Meal detail',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(mealModel.meal.strMealThumb ?? ''),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                Center(
                    child: Text(
                  mealModel.meal.strMeal ?? '',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                )),
                Center(
                    child: Text(
                  'Category : ${mealModel.meal.strCategory}',
                  style: const TextStyle(color: Colors.white),
                )),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Ingredients :',
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                  height: 200,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.deepPurple.withOpacity(0.3),
                  ),
                  child: ListView.builder(
                    itemExtent: 25,
                    itemCount: mealModel.meal.strMeasures.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            mealModel.meal.strIngredients[index]!,
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(mealModel.meal.strMeasures[index]!,
                              style: const TextStyle(color: Colors.white)),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // const Text('Instructions :',),
                Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.deepPurple.withOpacity(0.3),
                    ),
                    child: Text(mealModel.meal.strInstructions ?? '',
                        style: const TextStyle(color: Colors.white))),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
            height: 50,
            color: Colors.transparent,
            child: Column(
              children: [
                Container(
                    width: 140,
                    child: ElevatedButton.icon(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.keyboard_return_outlined),
                        label: const Text('Return'))),
              ],
            )),
      ),
    );
  }
}
