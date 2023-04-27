import 'package:fl_calculator/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Helper {
  static void setFirstNumberOperatorHistory(
      InputProvider controller, String operador) {
    controller.arithmeticOperador = operador;

    controller.firstNumber =
        double.parse(controller.controller.text.replaceAll(",", ""));
    controller.history = controller.controller.text + operador;
    controller.controller.text = '';
  }

  static void setSecondNumber(InputProvider controller) {
    if (controller.controller.text.isNotEmpty) {
      controller.secondNumber = double.parse(
        controller.controller.text.replaceAll(",", "").substring(
            controller.controller.text.indexOf(controller.arithmeticOperador) +
                1),
      );
      controller.isSecondNumber = false;
    }
  }

  static void calculateResult(InputProvider controller, String operador) {
    controller.history += controller.controller.text + operador;
    controller.totalHistory.add(controller.history);

    if (controller.arithmeticOperador == "+") {
      controller.resultado = controller.firstNumber + controller.secondNumber;
      if (controller.resultado.toString().endsWith(".0")) {
        controller.controller.text = formatNumber(controller.resultado);
      }
    }
    if (controller.arithmeticOperador == "-") {
      controller.resultado = controller.firstNumber - controller.secondNumber;
      if (controller.resultado.toString().endsWith(".0")) {
        controller.controller.text = formatNumber(controller.resultado);
      }
    }
    if (controller.arithmeticOperador == "x") {
      controller.resultado = controller.firstNumber * controller.secondNumber;
      if (controller.resultado.toString().endsWith(".0")) {
        controller.controller.text = formatNumber(controller.resultado);
      } else {
        controller.controller.text =
            formatNumberWithDecimal(controller.resultado);
      }
    }
    if (controller.arithmeticOperador == "/") {
      controller.resultado = controller.firstNumber / controller.secondNumber;
      controller.controller.text =
          controller.resultado.toString().endsWith(".0")
              ? formatNumber(controller.resultado)
              : formatNumberWithDecimal(controller.resultado);
    }
    if (controller.arithmeticOperador == "%") {
      controller.resultado =
          controller.firstNumber * controller.secondNumber / 100;
      controller.controller.text =
          controller.resultado.toString().endsWith(".0")
              ? formatNumber(controller.resultado)
              : formatNumberWithDecimal(controller.resultado);
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

  static String formatNumber(double value) {
    NumberFormat myFormat = NumberFormat('#,###');
    return myFormat.format(value);
  }

  static String formatNumberWithDecimal(double value) {
    var floatNumber = value.toString().split(".")[1];
    NumberFormat firstFormat = NumberFormat('#,###.0');
    NumberFormat secondFormat = NumberFormat('#,###.00000000000');

    if (floatNumber.length > 1) {
      return secondFormat.format(value);
    } else {
      return firstFormat.format(value);
    }
  }
}
