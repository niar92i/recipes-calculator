import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/models/meal_model.dart';
import 'meal_details_page.dart';

class MealListPage extends StatelessWidget {
  const MealListPage({super.key, required this.meals});

  final List<MealModel> meals;

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
            'Meals',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        body: ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  meals[index].meal.strMeal ?? '',
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  meals[index].meal.strCategory ?? '',
                  style: const TextStyle(color: Colors.white),
                ),
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(meals[index].meal.strMealThumb ?? ''),
                ),
                onTap: () {
                  Get.to(MealDetailsPage(mealModel: meals[index]));
                },
              );
            }),
        bottomNavigationBar: Container(
            height: 50,
            color: Colors.transparent,
            child: Column(
              children: [
                SizedBox(
                    width: 140,
                    child: ElevatedButton.icon(
                        onPressed: () {
                          Get.toNamed('/home');
                        },
                        icon: const Icon(Icons.keyboard_return_outlined),
                        label: const Text('Return'))),
              ],
            )),
      ),
    );
  }
}
