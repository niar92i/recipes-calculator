import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:get/get.dart';
import 'package:recipes_calculator/pages/calculator_result_page.dart';

class CalculatorController extends GetxController {
  var equation = "0".obs;
  String result = "0";
  int maxLength = 14;

  Widget calculatorButton(String textButton, Color colorText) {
    return OutlinedButton(
        onPressed: () => buttonPressed(textButton),
        child: Text(textButton,
            style: TextStyle(
                color: colorText,
                fontSize: 20,
                fontWeight: FontWeight.normal)));
  }

  buttonPressed(String textOnButtonPressed) {
    switch (textOnButtonPressed) {
      case "C":
        equation.value = "0";
        break;
      case "⌫":
        equation.value = equation.value.substring(0, equation.value.length - 1);
        if (equation.value.isEmpty) {
          equation.value = "0";
        }
        break;
      case "=":
        try {
          Parser parser = Parser();
          Expression expression = parser.parse(equation.value);
          ContextModel contextModel = ContextModel();
          double realResult =
              expression.evaluate(EvaluationType.REAL, contextModel);
          if (realResult % 1 == 0) {
            result = realResult
                .toInt()
                .toString();
          } else {
            result = realResult
                .toStringAsFixed(10)
                .replaceAll(RegExp(r'0*$'), '')
                .replaceAll(RegExp(r'\.$'), '');
          }
          if (result != "0") {
            Get.to(CalculatorResultPage(result: result));
            Get.delete<CalculatorController>();
          }
        } catch (e) {
          result = "Syntax error";
          equation.value = result;
          print(e);
        }
        break;
      default:
        if (equation.value == "0" &&
            textOnButtonPressed != "+" &&
            textOnButtonPressed != "*" &&
            textOnButtonPressed != "/" &&
            textOnButtonPressed != "%") {
          equation.value = textOnButtonPressed;
        } else if (equation.value.length <= maxLength &&
            equation.value != "0" &&
            !(equation.value.endsWith("+") && textOnButtonPressed == "+") &&
            !(equation.value.endsWith("-") && textOnButtonPressed == "-") &&
            !(equation.value.endsWith("*") && textOnButtonPressed == "*") &&
            !(equation.value.endsWith("/") && textOnButtonPressed == "/") &&
            !(equation.value.endsWith("%") && textOnButtonPressed == "%") &&
            !(equation.value.endsWith(".") && textOnButtonPressed == ".") &&
            !(equation.value.endsWith("+") &&
                (textOnButtonPressed == "-" ||
                    textOnButtonPressed == "*" ||
                    textOnButtonPressed == "/" ||
                    textOnButtonPressed == "." ||
                    textOnButtonPressed == "%"))&&
            !(equation.value.endsWith("-") &&
                (textOnButtonPressed == "+" ||
                    textOnButtonPressed == "*" ||
                    textOnButtonPressed == "." ||
                    textOnButtonPressed == "/" ||
                    textOnButtonPressed == "%"))&&
            !(equation.value.endsWith("*") &&
                (textOnButtonPressed == "-" ||
                    textOnButtonPressed == "+" ||
                    textOnButtonPressed == "." ||
                    textOnButtonPressed == "/" ||
                    textOnButtonPressed == "%"))&&
            !(equation.value.endsWith("/") &&
                (textOnButtonPressed == "-" ||
                    textOnButtonPressed == "+" ||
                    textOnButtonPressed == "*" ||
                    textOnButtonPressed == "." ||
                    textOnButtonPressed == "%"))&&
            !(equation.value.endsWith("%") &&
                (textOnButtonPressed == "-" ||
                    textOnButtonPressed == "*" ||
                    textOnButtonPressed == "+" ||
                    textOnButtonPressed == "." ||
                    textOnButtonPressed == "/"))&&
            !(equation.value.endsWith(".") &&
                (textOnButtonPressed == "-" ||
                    textOnButtonPressed == "*" ||
                    textOnButtonPressed == "+" ||
                    textOnButtonPressed == "%" ||
                    textOnButtonPressed == "/"))) {
          equation.value = equation.value + textOnButtonPressed;
        }
    }
  }
}
