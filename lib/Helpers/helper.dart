import 'package:fl_calculator/providers/provider.dart';
import 'package:flutter/material.dart';

class Helper {
  static void setFirstNumberOperatorHistory(
      InputProvider controller, String operador) {
    controller.arithmeticOperador = operador;

    controller.firstNumber = double.parse(controller.controller.text);
    controller.history = controller.controller.text + operador;
    controller.controller.text = '';
  }

  static void calculateResult(InputProvider controller, String operador) {
    controller.secondNumber = double.parse(controller.controller.text
        .substring(controller.controller.text.indexOf("+") + 1));
    controller.history += controller.controller.text + operador;
    // print(
    //     "Primer numero: ${inputProvider.firstNumber} ${inputProvider.arithmeticOperador} ${inputProvider.secondNumber}");
    if (controller.arithmeticOperador == "+") {
      controller.resultado = controller.firstNumber + controller.secondNumber;
      if (controller.resultado.toString().endsWith(".0")) {
        controller.controller.text =
            controller.resultado.toString().replaceAll(".0", "");
      }
    }
  }

  static Future<dynamic> showModal(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => const Text(
        'No se puede mayor de 15 digitos',
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}
