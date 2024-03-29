import 'package:fl_calculator/widgets/buttons.dart';
import 'package:fl_calculator/widgets/custom_divider.dart';
import 'package:fl_calculator/widgets/header.dart';
import 'package:fl_calculator/widgets/input_area.dart';
import 'package:fl_calculator/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class ScientificScreen extends StatelessWidget {
  const ScientificScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff19191A),
      drawer: const SideMenu(),
      body: Stack(
        children: [
          Column(
            children: const [
              Expanded(flex: 2, child: InputArea()),
              CustomDivider(),
              Expanded(flex: 3, child: Buttons()),
            ],
          ),
          const Header(title: "Científica"),
        ],
      ),
    );
  }
}
