class Meal {
  String? strIdMeal;
  String? strMeal;
  String? strDrinkAlternate;
  String? strCategory;
  String? strArea;
  String? strInstructions;
  String? strMealThumb;
  String? strTags;
  String? strYoutube;
  List<String?> strIngredients;
  List<String?> strMeasures;
  String? strSource;
  String? strImageSource;
  bool? strCreativeCommonsConfirmed;
  String? strDateModified;

  Meal({
    required this.strIdMeal,
    required this.strMeal,
    required this.strDrinkAlternate,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strTags,
    required this.strYoutube,
    required this.strIngredients,
    required this.strMeasures,
    required this.strSource,
    required this.strImageSource,
    required this.strCreativeCommonsConfirmed,
    required this.strDateModified,
  });
  factory Meal.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    List<String> measures = [];

    for (int i=1; i<=20; i++) {
      String ingredientKey = 'strIngredient$i';
      String measureKey = 'strMeasure$i';

      if (json[ingredientKey] != null && json[ingredientKey].trim().isNotEmpty) {
        ingredients.add(json[ingredientKey]);
      }

      if (json[measureKey] != null && json[measureKey].trim().isNotEmpty) {
        measures.add(json[measureKey]);
      }
    }

    return Meal(
      strIdMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strDrinkAlternate: json['strDrinkAlternate'],
      strCategory: json['strCategory'],
      strArea: json['strArea'],
      strInstructions: json['strInstructions'],
      strMealThumb: json['strMealThumb'],
      strTags: json['strTags'],
      strYoutube: json['strYoutube'],
      strIngredients: ingredients,
      strMeasures: measures,
      strSource: json['strSource'],
      strImageSource: json['strImageSource'],
      strCreativeCommonsConfirmed: json['strCreativeCommonConfirmed'],
      strDateModified: json['dateModified'],
    );
  }
}