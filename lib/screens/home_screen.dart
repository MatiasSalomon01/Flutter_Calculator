import 'package:fl_calculator/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Color(0xff292929),
      ),
      body: Column(
        children: const [
          Expanded(flex: 2, child: InputArea()),
          Expanded(flex: 3, child: Buttons()),
        ],
      ),
    );
  }
}
