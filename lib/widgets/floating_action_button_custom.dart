import 'package:fl_calculator/Helpers/helper.dart';
import 'package:fl_calculator/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';

class FloatingActionButtonCustom extends StatelessWidget {
  final dynamic content;
  final Color color;
  final String value;
  const FloatingActionButtonCustom({
    super.key,
    required this.content,
    // this.color = const Color.fromARGB(255, 77, 75, 75),
    this.color = const Color(0xff2D2D2E),
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final inputProvider = Provider.of<InputProvider>(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 0,
        shape: const CircleBorder(),
      ),
      child: content,
      onPressed: () {
        if (value == '()' || value == '+/-') return;

        if (value == "C") {
          inputProvider.cleanInput();
        } else {
          if (inputProvider.controller.text.length >= 19) {
            if (value == "+" ||
                value == "-" ||
                value == "x" ||
                value == "/" ||
                value == "%") {
              Helper.setFirstNumberOperatorHistory(inputProvider, value);
              inputProvider.isFirstNumber = false;
              return;
            }
            Helper.showModal(context);
            return;
          }
          if (inputProvider.controller.text.length > 14) {
            inputProvider.isLarger = true;
          } else {
            inputProvider.isLarger = false;
          }

          if (value == ".") {
            inputProvider.controller.text += value;
            return;
          }

          if (value == "+" ||
              value == "-" ||
              value == "x" ||
              value == "/" ||
              value == "%") {
            Helper.setFirstNumberOperatorHistory(inputProvider, value);
            inputProvider.isFirstNumber = false;
            return;
          }

          if (value == "=" && inputProvider.isFirstNumber == true) return;

          if (value == "=" && inputProvider.isFirstNumber == false) {
            Helper.setSecondNumber(inputProvider);

            if (inputProvider.isSecondNumber == true) return;

            if (inputProvider.secondNumber.toString().isNotEmpty) {
              Helper.calculateResult(inputProvider, value);
              inputProvider.isFirstNumber = true;
              inputProvider.isSecondNumber = true;
              if (inputProvider.controller.text.length > 14) {
                inputProvider.isLarger = true;
              } else {
                inputProvider.isLarger = false;
              }
            }

            if (inputProvider.controller.text.length >= 20) {
              inputProvider.controller.text =
                  inputProvider.resultado.toStringAsExponential();
            }
            return;
          }

          inputProvider.controller.text += value;

          if (inputProvider.controller.text.endsWith('.0')) return;

          inputProvider.controller.text = Helper.formatNumber(
            double.parse(inputProvider.controller.text.replaceAll(",", "")),
          );
        }
      },
    );
  }
}

class FloatingActionButtonCustom2 extends StatelessWidget {
  final dynamic content;
  final Color color;
  final String value;
  FloatingActionButtonCustom2({
    super.key,
    required this.content,
    // this.color = const Color.fromARGB(255, 77, 75, 75),
    this.color = const Color(0xff2D2D2E),
    required this.value,
  });

  final formatter = NumberFormat.decimalPattern();

  void checkLength(InputProvider inputProvider) {
    if (inputProvider.controller.text.length > 14) {
      inputProvider.isLarger = true;
    } else {
      inputProvider.isLarger = false;
    }
  }

  String formatExpression(String expression) {
    return expression.replaceAll(',', '').replaceAllMapped(
          RegExp(r'\d+(?:\.\d+)?'),
          (match) => formatter.format(double.parse(match.group(0)!)),
        );
  }

  void insertText(TextEditingController controller, String value) {
    final currentPosition = controller.selection.baseOffset;
    final textToInsert = value;
    final newValue =
        controller.text.substring(0, currentPosition).replaceAll(",", "") +
            textToInsert +
            controller.text.substring(currentPosition).replaceAll(",", "");
    controller.value = controller.value.copyWith(
        text: formatExpression(newValue),
        selection: TextSelection.collapsed(
            offset: currentPosition + textToInsert.length));
  }

  @override
  Widget build(BuildContext context) {
    var inputProvider = Provider.of<InputProvider>(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 0,
        shape: const CircleBorder(),
      ),
      child: content,
      onPressed: () {
        if (value == '+/-') return;
        if (inputProvider.hasDecimal && value == ".") return;

        if (value == "C") {
          // inputProvider.parenthesis = ")";
          inputProvider.hasDecimal = false;
          inputProvider.cleanInput();
          return;
        }
        if (inputProvider.controller.selection.baseOffset != -1) {
          insertText(inputProvider.controller, value);
          return;
        }

        // if (inputProvider.controller.text.length >= 19) {
        //   Helper.showModal(context);
        //   return;
        // }

        checkLength(inputProvider);

        if (value == "=") {
          Helper.saveHistory(inputProvider);
          inputProvider.controller.text = inputProvider.history;
          inputProvider.history = "";
          checkLength(inputProvider);
          return;
        }

        // if (value == "()") {
        //   if (inputProvider.parenthesis == "(") {
        //     inputProvider.controller.text += ")";
        //     inputProvider.parenthesis = ")";
        //     return;
        //   }
        //   inputProvider.controller.text += "(";
        //   inputProvider.parenthesis = "(";
        //   return;
        // }

        if (value == '.') {
          inputProvider.hasDecimal = true;
          inputProvider.controller.text += value;
          return;
        }

        inputProvider.controller.text += value;

        if (value == "+" ||
            value == "-" ||
            value == "x" ||
            value == "/" ||
            value == "%") {
          inputProvider.hasDecimal = false;
        }

        var x = RegExp(r'\d+(?:\.\d+)?\s*[+\-x\/%]\s*\d+(?:\.\d+)?')
            .hasMatch(inputProvider.controller.text);
        // print("Primero: $x");
        var y = RegExp(r'^.*(?<![+\-x\/\%])$')
            .hasMatch(inputProvider.controller.text);
        // print("Segundo: $y");
        // if (x) {
        //   inputProvider.hasDecimal = false;
        // }
        // try {
        if (x && y) {
          var expression = inputProvider.controller.text.replaceAll("x", "*");
          Helper.calculateResultScientific(
              inputProvider, expression.replaceAll(",", ""), value);
        }
        inputProvider.controller.text =
            formatExpression(inputProvider.controller.text);
        // inputProvider.controller.text = Helper.formatNumber(
        //   double.parse(inputProvider.controller.text.replaceAll(",", "")),
        // );
        // } catch (x) {
        //   print(x);
        // }
      },
    );
  }
}
