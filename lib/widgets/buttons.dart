import 'package:fl_calculator/constants/consts.dart';
import 'package:fl_calculator/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<InputProvider>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      // color: const Color(0xff292929),
      // color: Colors.red,
      decoration: BoxDecoration(
        color: const Color(0xff19191A),
        border: Border.all(width: 0, color: const Color(0xff19191A)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(right: 20, left: 20),
              mainAxisSpacing: 10,
              crossAxisSpacing: 15,
              crossAxisCount: provider.currentScreen == "standar" ? 4 : 5,
              children: provider.currentScreen == "standar"
                  ? Constants.customButtons
                  : Constants.customButtonsScientific,
            ),
          ),
        ],
      ),
    );
  }
}
