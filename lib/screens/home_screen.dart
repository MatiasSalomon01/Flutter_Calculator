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
        children: [
          const Expanded(flex: 2, child: InputArea()),
          Container(
            color: const Color(0xff292929),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(thickness: 1, color: Colors.grey[700]),
          ),
          const Expanded(flex: 3, child: Buttons()),
        ],
      ),
    );
  }
}
