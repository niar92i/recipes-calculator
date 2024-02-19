import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipes_calculator/pages/calculator_page.dart';
import 'package:recipes_calculator/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recipes_calculator/pages/login_page.dart';
import 'package:recipes_calculator/pages/meals_page.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAppCheck firebaseAppCheck = FirebaseAppCheck.instance;
  firebaseAppCheck.activate(
    androidProvider: AndroidProvider.debug,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return GetMaterialApp(
      initialRoute: '/login',
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => LoginPage(),
        '/calculator': (context) => CalculatorPage(),
        '/recipes': (context) => MealsPage(),
      },
      title: 'Recipes Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: auth.currentUser == null ? LoginPage() : const HomePage(),
    );
  }
}
