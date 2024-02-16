import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_calculator/controllers/calculator_controller.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  CalculatorController calculatorController = Get.put(CalculatorController());

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
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Get.toNamed('/home');
                    Get.delete<CalculatorController>();
                  },
                );
              },
            ),
            backgroundColor: Colors.transparent,
            title: const Text(
              'Calculator',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.deepPurple.withOpacity(0.3),
                  ),
                child: Obx(() => Text('${calculatorController.equation}', style: const TextStyle(color: Colors.white, fontSize: 40),))
              ),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.deepPurple.withOpacity(0.3),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        calculatorController.calculatorButton("C", Colors.white),
                        calculatorController.calculatorButton("⌫", Colors.white),
                        calculatorController.calculatorButton("%", Colors.white),
                        calculatorController.calculatorButton("/", Colors.white),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        calculatorController.calculatorButton("7", Colors.white),
                        calculatorController.calculatorButton("8", Colors.white),
                        calculatorController.calculatorButton("9", Colors.white),
                        calculatorController.calculatorButton("*", Colors.white),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        calculatorController.calculatorButton("4", Colors.white),
                        calculatorController.calculatorButton("5", Colors.white),
                        calculatorController.calculatorButton("6", Colors.white),
                        calculatorController.calculatorButton("-", Colors.white),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        calculatorController.calculatorButton("1", Colors.white),
                        calculatorController.calculatorButton("2", Colors.white),
                        calculatorController.calculatorButton("3", Colors.white),
                        calculatorController.calculatorButton("+", Colors.white),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        calculatorController.calculatorButton(".", Colors.white),
                        calculatorController.calculatorButton("0", Colors.white),
                        calculatorController.calculatorButton("00", Colors.white),
                        calculatorController.calculatorButton("=", Colors.white),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
