import 'package:fl_calculator/providers/provider.dart';
import 'package:fl_calculator/screens/standar_screen.dart';
import 'package:fl_calculator/screens/scientific_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => InputProvider(),
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'standar',
      routes: {
        'standar': (context) => const StandarScreen(),
        'scientific': (context) => const ScientificScreen(),
      },
    );
  }
}
