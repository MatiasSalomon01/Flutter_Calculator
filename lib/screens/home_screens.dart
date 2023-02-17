import 'package:fl_calculator/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: const Botones())
    );
  }
}

class Botones extends StatelessWidget {
  const Botones({super.key});

  @override
  Widget build(BuildContext context) {

    final theme = Provider.of<ThemeChanger>(context);
    return Row(
      children: [
        FloatingActionButton(
          onPressed:() => theme.setTheme(
            ThemeData(
              brightness: Brightness.light,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.grey
              )
            )
          ),
          child: const Icon(Icons.light_mode_outlined)
        ),
        FloatingActionButton(
          onPressed: () => theme.setTheme(
            ThemeData(
              brightness: Brightness.dark,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.grey
              )
            )
          ),
          child: const Icon(Icons.dark_mode_outlined)
        )
      ],
    );
  }
}