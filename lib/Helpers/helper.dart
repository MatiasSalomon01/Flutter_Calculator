import 'package:fl_calculator/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:function_tree/function_tree.dart';

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

    if (controller.arithmeticOperador == "+") {
      controller.resultado = controller.firstNumber + controller.secondNumber;
      if (controller.resultado.toString().endsWith(".0")) {
        controller.controller.text = formatNumber(controller.resultado);
      } else {
        controller.controller.text =
            formatNumberWithDecimal(controller.resultado);
      }
    }
    if (controller.arithmeticOperador == "-") {
      controller.resultado = controller.firstNumber - controller.secondNumber;
      if (controller.resultado.toString().endsWith(".0")) {
        controller.controller.text = formatNumber(controller.resultado);
      } else {
        controller.controller.text =
            formatNumberWithDecimal(controller.resultado);
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
    controller.totalHistory
        .add(controller.history + controller.controller.text);
  }

  static Future<dynamic> showModal(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => const Text(
        'No se puede mayor de 15 digitos',
        style: TextStyle(fontSize: 25, fontFamily: 'Oxanium'),
      ),
    );
  }

  static String formatNumber(double value) {
    var newValue = value.toString();
    NumberFormat myFormat = NumberFormat('#,###');

    if (newValue.endsWith(".0")) {
      return myFormat.format(value);
    } else {
      return newValue;
    }
  }

  static String formatNumberWithDecimal(double value) {
    var floatNumber = value.toString().split(".");
    NumberFormat firstFormat = NumberFormat('#,###.0');
    NumberFormat secondFormat = NumberFormat('#,###.000000');

    if (floatNumber[1].length > 1) {
      if (floatNumber[1].contains('000000')) {
        var decimalNumber = floatNumber[1].replaceAll('0', '');
        return '${floatNumber[0]}.$decimalNumber';
        // return firstFormat.format(value);
      }

      if (floatNumber[1].length == 2) {
        return '$value';
      }

      var result = secondFormat.format(value).split('.');
      return '${result[0] == "" ? 0 : result[0]}.${result[1].replaceAll('0', '')}';

      // var start = floatNumber.indexOf("0");
      // var last = floatNumber.lastIndexOf("0");
      // print(floatNumber);
      // print(floatNumber.substring(start, last + 1));
    } else {
      var result = firstFormat.format(value).split('.');
      return '${result[0] == "" ? 0 : result[0]}.${result[1]}';
    }
  }

  static void calculateResultScientific(
      InputProvider inputProvider, String expression, String operador) {
    Parser parser = Parser();

    if (expression.contains("%")) {
      var newExpression = expression.split("%");
      Expression x =
          parser.parse("${newExpression[0]}*(${newExpression[1]}/100)");
      double result = x.evaluate(EvaluationType.REAL, ContextModel());
      inputProvider.history = result.toString().endsWith(".0")
          ? formatNumber(result)
          : formatNumberWithDecimal(result);
      return;
    }
    Expression exp = parser.parse(expression);
    double result = exp.evaluate(EvaluationType.REAL, ContextModel());
    // print(result);
    inputProvider.history = result.toString().endsWith(".0")
        ? formatNumber(result)
        : result.toString();
    aaaa(expression);
  }

  static void saveHistory(InputProvider inputProvider) {
    inputProvider.totalHistory
        .add("${inputProvider.controller.text}=${inputProvider.history}");
  }

  static void calcular(InputProvider inputProvider, String value) {
    var lista = ['cos', 'sin', 'tan', 'log', 'pi', 'rad'];
    try {
      if (!inputProvider.textInserted || value.isEmpty) {
        inputProvider.expression += value;
      }
      var x = RegExp(r'\d+(?:\.\d+)?\s*[+\-x\/%]\s*\d+(?:\.\d+)?')
          .hasMatch(inputProvider.expression);

      // for (var keyWord in lista) {
      //   if (inputProvider.expression.contains(keyWord)) {
      //     print(keyWord);
      //   }
      // }
      var y = RegExp(r'^.*(?<![+\-x\/\%])$').hasMatch(inputProvider.expression);

      if (x && y) {
        var expresion = inputProvider.expression.replaceAll("x", "*");
        Helper.calculateResultScientific(
            inputProvider, expresion.replaceAll(",", ""), value);
      }
      inputProvider.controller.text =
          formatExpression(inputProvider.expression);
      inputProvider.controller.selection =
          TextSelection.collapsed(offset: inputProvider.cursorPosition);
      // ignore: empty_catches
    } catch (e) {}
  }

  static String formatExpression(String expression) {
    final formatter = NumberFormat.decimalPattern();

    return expression.replaceAll(',', '').replaceAllMapped(
          RegExp(r'\d+(?:\.\d+)?'),
          (match) => formatter.format(double.parse(match.group(0)!)),
        );
  }

  static void aaaa(String expression) {
    print(evaluarExpresion(expression));
  }

  static double evaluarExpresion(String expression) {
    return expression.interpret().toDouble();
  }
}
