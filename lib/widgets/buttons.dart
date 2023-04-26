import 'package:fl_calculator/constants/consts.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: const Color(0xff292929),
      // color: Colors.red,
      child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(right: 10, left: 10, top: 5),
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          crossAxisCount: 4,
          children: Constants.customButtons),
    );
  }
}
