import 'dart:convert';

import 'package:fl_calculator/Helpers/helper.dart';
import 'package:fl_calculator/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputProvider = Provider.of<InputProvider>(context);

    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.only(top: 100),
            color: const Color(0xff292929),
            // color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Text(
                    '${inputProvider.history}',
                    style: TextStyle(
                        color: Color.fromARGB(255, 117, 117, 117),
                        fontSize: 25),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: TextField(
                    controller: inputProvider.controller,
                    keyboardType: TextInputType.none,
                    autofocus: true,
                    strutStyle: const StrutStyle(fontWeight: FontWeight.bold),
                    cursorColor: Colors.white,
                    textAlign: TextAlign.end,
                    decoration: const InputDecoration(border: InputBorder.none),
                    style: const TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: const Color(0xff292929),
            // color: Colors.red,
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(right: 10, left: 10, top: 5),
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              crossAxisCount: 4,
              children: const [
                FloatingActionButtonCustom(value: 'C'),
                FloatingActionButtonCustom(value: '()'),
                FloatingActionButtonCustom(value: '%'),
                FloatingActionButtonCustom(value: '/'),
                FloatingActionButtonCustom(value: '7'),
                FloatingActionButtonCustom(value: '8'),
                FloatingActionButtonCustom(value: '9'),
                FloatingActionButtonCustom(value: 'x'),
                FloatingActionButtonCustom(value: '4'),
                FloatingActionButtonCustom(value: '5'),
                FloatingActionButtonCustom(value: '6'),
                FloatingActionButtonCustom(value: '-'),
                FloatingActionButtonCustom(value: '1'),
                FloatingActionButtonCustom(value: '2'),
                FloatingActionButtonCustom(value: '3'),
                FloatingActionButtonCustom(value: '+'),
                FloatingActionButtonCustom(value: '+/-'),
                FloatingActionButtonCustom(value: '0'),
                FloatingActionButtonCustom(value: ','),
                FloatingActionButtonCustom(value: '='),
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class FloatingActionButtonCustom extends StatelessWidget {
  final String value;
  const FloatingActionButtonCustom({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    final inputProvider = Provider.of<InputProvider>(context);

    return FloatingActionButton(
      backgroundColor: const Color.fromARGB(255, 77, 75, 75),
      highlightElevation: 0,
      elevation: 0,
      // child: const Icon(Icons.add, size: 35),
      child: Text(value, style: TextStyle(fontSize: 35)),
      onPressed: () {
        if (value == "C") {
          inputProvider.cleanInput();
        } else {
          if (inputProvider.controller.text.length >= 15) {
            Helper.showModal(context);
            return;
          }
          if (value == "+" || value == "-" || value == "x" || value == "/") {
            Helper.setFirstNumberOperatorHistory(inputProvider, value);
            return;
          }

          if (value == "=") {
            Helper.calculateResult(inputProvider, value);
            return;
          }
          inputProvider.controller.text += value;
          inputProvider.controller.text = Helper.formatNumber(
              double.parse(inputProvider.controller.text.replaceAll(",", "")));
        }
      },
    );
  }
}
