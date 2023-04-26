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
      drawer: const Drawer(
        backgroundColor: Color(0xff292929),
      ),
      body: Stack(
        children: [
          Column(
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
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          inputProvider.history,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 117, 117, 117),
                              fontSize: 25),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: TextField(
                          controller: inputProvider.controller,
                          keyboardType: TextInputType.none,
                          autofocus: true,
                          strutStyle:
                              const StrutStyle(fontWeight: FontWeight.bold),
                          cursorColor: Colors.white,
                          textAlign: TextAlign.end,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 50),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(right: 20),
                          // color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  try {
                                    var text = inputProvider.controller.text;
                                    var cursorPos = inputProvider.controller
                                                .selection.baseOffset <
                                            0
                                        ? text.length
                                        : inputProvider
                                            .controller.selection.baseOffset;
                                    final newText =
                                        text.substring(0, cursorPos - 1) +
                                            text.substring(cursorPos);
                                    inputProvider.controller.value =
                                        TextEditingValue(
                                      text: newText,
                                      selection: TextSelection.collapsed(
                                        offset: cursorPos - 1,
                                      ),
                                    );
                                    inputProvider.controller.text =
                                        Helper.formatNumber(
                                      double.parse(
                                        inputProvider.controller.text
                                            .replaceAll(",", ""),
                                      ),
                                    );
                                    // ignore: empty_catches
                                  } catch (e) {}
                                },
                                icon: const Icon(
                                  Icons.backspace_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
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
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(right: 10, left: 10, top: 5),
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
          ),
          // SafeArea(
          //   child: Container(
          //     padding: EdgeInsets.all(5),
          //     child: Builder(
          //       builder: (context) => IconButton(
          //         onPressed: () {
          //           Scaffold.of(context).openDrawer();
          //         },
          //         icon: Icon(
          //           Icons.menu,
          //           color: Colors.white,
          //           size: 32,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
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
      child: Text(value, style: const TextStyle(fontSize: 35)),
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
            inputProvider.isFirstNumber = false;
            return;
          }

          if (value == "=" && inputProvider.isFirstNumber == true) return;

          if (value == "=" && inputProvider.isFirstNumber == false) {
            Helper.calculateResult(inputProvider, value);
            inputProvider.isFirstNumber = true;
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
