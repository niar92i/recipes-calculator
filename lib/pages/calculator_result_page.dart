import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorResultPage extends StatelessWidget {
  const CalculatorResultPage({super.key, required this.result });

  final String result;

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
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: const Text('Result', style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.deepPurple.withOpacity(0.3),
                  ),
                  child: Text(result, style: const TextStyle(color: Colors.white, fontSize: 40),)
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: 140,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.toNamed('/calculator');
                  },
                  icon: const Icon(Icons.keyboard_return_outlined),
                  label: const Text('Return'),
                ),
              ),
              SizedBox(
                width: 140,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.toNamed('/home');
                  },
                  icon: const Icon(Icons.menu_book_outlined),
                  label: const Text('Menu'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
