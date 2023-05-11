import 'package:fl_calculator/preferences/preferences.dart';
import 'package:fl_calculator/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckingScreen extends StatelessWidget {
  const CheckingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff19191A),
      body: Center(
        child: FutureBuilder(
          future: Preferences.init(),
          builder: (context, snapshot) {
            if (Preferences.screen != '') {
              Future.microtask(() {
                Navigator.pushReplacementNamed(context, Preferences.screen);
              });
            } else {
              Future.microtask(() {
                Navigator.pushReplacementNamed(context, 'standar');
              });
            }
            return const CircularProgressIndicator(
              color: Colors.grey,
            );
          },
        ),
      ),
    );
  }
}
