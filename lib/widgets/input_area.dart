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
          _BetweenButtons(inputProvider: inputProvider)
        ],
      ),
    );
  }
}

class _BetweenButtons extends StatelessWidget {
  const _BetweenButtons({
    super.key,
    required this.inputProvider,
  });

  final InputProvider inputProvider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const _ButtonHistory(),
            _BackSpaceButton(inputProvider: inputProvider),
          ],
        ),
      ),
    );
  }
}

class _ButtonHistory extends StatelessWidget {
  const _ButtonHistory();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: contentBox(context),
            );
          },
        );
      },
      icon: const Icon(
        Icons.history,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}

Widget contentBox(BuildContext context) {
  final inputProvider = Provider.of<InputProvider>(context);
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xff292929),
      borderRadius: BorderRadius.circular(30),
    ),
    height: MediaQuery.of(context).size.height / 2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Historial',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontFamily: 'Oxanium'),
          ),
        ),
        Container(
          height: 0.5,
          color: Colors.grey,
          margin: const EdgeInsets.symmetric(horizontal: 10),
        ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.fast),
            padding: const EdgeInsets.only(top: 10),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              // return Text(
              //   inputProvider.totalHistory[index],
              //   style: const TextStyle(
              //       color: Colors.white, fontSize: 27, fontFamily: 'Oxanium'),
              // );
              return ListTile(
                leading: const Text(
                  '   -',
                  style: TextStyle(
                      color: Colors.white, fontSize: 23, fontFamily: 'Oxanium'),
                ),
                title: Text(
                  inputProvider.totalHistory[index],
                  style: const TextStyle(
                      color: Colors.white, fontSize: 27, fontFamily: 'Oxanium'),
                ),
              );
            },
            itemCount: inputProvider.totalHistory.length,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextButton(
            onPressed: () {
              inputProvider.totalHistory.clear();
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              backgroundColor: const Color.fromARGB(255, 50, 131, 127),
              shape: const StadiumBorder(
                side: BorderSide(),
              ),
            ),
            child: const Text(
              'Eliminar Historial',
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontFamily: 'Oxanium'),
            ),
          ),
        ),
      ],
    ),
  );
}

class _BackSpaceButton extends StatelessWidget {
  const _BackSpaceButton({
    required this.inputProvider,
  });

  final InputProvider inputProvider;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        try {
          var text = inputProvider.controller.text;
          var cursorPos = inputProvider.controller.selection.baseOffset < 0
              ? text.length
              : inputProvider.controller.selection.baseOffset;
          final newText =
              text.substring(0, cursorPos - 1) + text.substring(cursorPos);
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
        style: const TextStyle(
            color: Colors.white, fontSize: 50, fontFamily: 'Oxanium'),
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
            color: Color.fromARGB(255, 117, 117, 117),
            fontSize: 25,
            fontFamily: 'Oxanium'),
      ),
    );
  }
}
