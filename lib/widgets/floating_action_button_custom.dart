import 'package:fl_calculator/Helpers/helper.dart';
import 'package:fl_calculator/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FloatingActionButtonCustom extends StatelessWidget {
  final String value;
  final Color color;
  const FloatingActionButtonCustom({
    super.key,
    required this.value,
    this.color = const Color.fromARGB(255, 77, 75, 75),
  });

  @override
  Widget build(BuildContext context) {
    final inputProvider = Provider.of<InputProvider>(context);

    return FloatingActionButton(
      backgroundColor: color,
      highlightElevation: 0,
      elevation: 0,
      child: Text(value, style: const TextStyle(fontSize: 35)),
      onPressed: () {
        if (value == '()' || value == '+/-') return;
        if (value == "C") {
          inputProvider.cleanInput();
        } else {
          if (inputProvider.controller.text.length >= 15) {
            Helper.showModal(context);
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
            if (!inputProvider.secondNumber.toString().isEmpty) {
              Helper.calculateResult(inputProvider, value);
              inputProvider.isFirstNumber = true;
              inputProvider.isSecondNumber = true;
            }
            return;
          }

          inputProvider.controller.text += value;
          inputProvider.controller.text = Helper.formatNumber(
            double.parse(inputProvider.controller.text.replaceAll(",", "")),
          );
        }
      },
    );
  }
}
