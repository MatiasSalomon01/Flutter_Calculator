import 'package:fl_calculator/preferences/preferences.dart';
import 'package:fl_calculator/screens/standar_screen.dart';
import 'package:flutter/material.dart';

class CheckingScreen extends StatefulWidget {
  const CheckingScreen({Key? key}) : super(key: key);

  @override
  State<CheckingScreen> createState() => _CheckingScreenState();
}

class _CheckingScreenState extends State<CheckingScreen> {
  // @override
  // void initState() async {
  //   super.initState();
  //   await checkSavedScreen();
  // }

  // Future<void> checkSavedScreen() async {
  //   if (Preferences.screen != '') {
  //     //   Navigator.pushReplacementNamed(context, Preferences.screen);
  //     // }

  //     Navigator.pushReplacementNamed(context, Preferences.screen);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff19191A),
      body: Center(
        child: FutureBuilder(
          // future: checkSavedScreen(),
          builder: (context, snapshot) {
            if (Preferences.screen != '') {
              Future.microtask(() {
                Navigator.pushReplacementNamed(context, Preferences.screen);
              });
            }
            return CircularProgressIndicator(
              color: Colors.grey,
            );
          },
        ),
      ),
    );
  }
}
