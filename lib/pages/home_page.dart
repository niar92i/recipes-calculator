import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipes_calculator/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
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
                'Main Menu',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 140,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Get.toNamed('/calculator');
                      },
                      icon: const Icon(
                        Icons.calculate_outlined,
                      ),
                      label: const Text('Calculator'),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 140,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu_book_outlined,
                      ),
                      label: const Text('Recipes'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content:
                              const Text('Are you sure you want to logout ?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => homeController.logout(),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.logout_outlined,
                    ),
                    label: const Text('Logout'),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
