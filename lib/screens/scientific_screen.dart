import 'package:fl_calculator/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class ScientificScreen extends StatelessWidget {
  const ScientificScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const SideMenu(),
      body: Center(
        child: Text('ScientificScreen'),
      ),
    );
  }
}
