import 'package:fl_calculator/Helpers/helper.dart';
import 'package:fl_calculator/providers/provider.dart';
import 'package:flutter/material.dart';
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
  const FloatingActionButtonCustom2({
    super.key,
    required this.content,
    // this.color = const Color.fromARGB(255, 77, 75, 75),
    this.color = const Color(0xff2D2D2E),
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    var inputProvider = Provider.of<InputProvider>(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 0,
        fixedSize: Size(50, 60),
        shape: const CircleBorder(),
      ),
      child: content,
      onPressed: () {
        if (value == '+/-') return;

        if (value == "C") {
          inputProvider.parenthesis = ")";
          inputProvider.cleanInput();
          return;
        }

        // if (inputProvider.controller.text.length >= 19) {
        //   Helper.showModal(context);
        //   return;
        // }

        if (inputProvider.controller.text.length > 14) {
          inputProvider.isLarger = true;
        } else {
          inputProvider.isLarger = false;
        }

        if (value == "=") {
          inputProvider.controller.text = inputProvider.history;
          inputProvider.history = "";
          return;
        }

        if (value == "()") {
          if (inputProvider.parenthesis == "(") {
            inputProvider.controller.text += ")";
            inputProvider.parenthesis = ")";
            return;
          }
          inputProvider.controller.text += "(";
          inputProvider.parenthesis = "(";
          return;
        }

        inputProvider.controller.text += value;
        var x = RegExp(r'\d+[+\-x\/\%]+\d+')
            .hasMatch(inputProvider.controller.text);

        var y = RegExp(r'^.*(?<![+\-x\/\%])$')
            .hasMatch(inputProvider.controller.text);

        try {
          if (x && y) {
            var expression = inputProvider.controller.text.replaceAll("x", "*");
            Helper.calculateResultScientific(
                inputProvider, expression.replaceAll(",", ""), value);
          }
          inputProvider.controller.text = Helper.formatNumber(
            double.parse(inputProvider.controller.text.replaceAll(",", "")),
          );
        } catch (x) {}
      },
    );
  }
}
