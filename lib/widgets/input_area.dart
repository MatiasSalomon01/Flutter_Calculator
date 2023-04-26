import 'package:fl_calculator/Helpers/helper.dart';
import 'package:fl_calculator/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputArea extends StatelessWidget {
  const InputArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputProvider = Provider.of<InputProvider>(context);

    return Container(
      padding: const EdgeInsets.only(top: 100),
      color: const Color(0xff292929),
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _History(inputProvider: inputProvider),
          const SizedBox(height: 30),
          _TextFieldCustom(inputProvider: inputProvider),
          _BackSpaceButton(inputProvider: inputProvider)
        ],
      ),
    );
  }
}

class _BackSpaceButton extends StatelessWidget {
  const _BackSpaceButton({
    required this.inputProvider,
  });

  final InputProvider inputProvider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                  var cursorPos =
                      inputProvider.controller.selection.baseOffset < 0
                          ? text.length
                          : inputProvider.controller.selection.baseOffset;
                  final newText = text.substring(0, cursorPos - 1) +
                      text.substring(cursorPos);
                  inputProvider.controller.value = TextEditingValue(
                    text: newText,
                    selection: TextSelection.collapsed(
                      offset: cursorPos - 1,
                    ),
                  );
                  inputProvider.controller.text = Helper.formatNumber(
                    double.parse(
                      inputProvider.controller.text.replaceAll(",", ""),
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
    );
  }
}

class _TextFieldCustom extends StatelessWidget {
  const _TextFieldCustom({
    required this.inputProvider,
  });

  final InputProvider inputProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: TextField(
        controller: inputProvider.controller,
        keyboardType: TextInputType.none,
        autofocus: true,
        strutStyle: const StrutStyle(fontWeight: FontWeight.bold),
        cursorColor: Colors.white,
        textAlign: TextAlign.end,
        decoration: const InputDecoration(border: InputBorder.none),
        style: const TextStyle(color: Colors.white, fontSize: 50),
      ),
    );
  }
}

class _History extends StatelessWidget {
  const _History({
    required this.inputProvider,
  });

  final InputProvider inputProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Text(
        inputProvider.history,
        style: const TextStyle(
            color: Color.fromARGB(255, 117, 117, 117), fontSize: 25),
      ),
    );
  }
}
