import 'package:fl_calculator/preferences/preferences.dart';
import 'package:fl_calculator/providers/provider.dart';
import 'package:fl_calculator/screens/standar_screen.dart';
import 'package:fl_calculator/widgets/custom_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff19191A),
      child: Column(
        children: [
          const SizedBox(height: 20),
          SafeArea(
            child: Container(
              margin: EdgeInsets.only(left: 15),
              child: ListTile(
                title: const Text(
                  'Opciones',
                  style: TextStyle(
                      color: Colors.white, fontSize: 25, fontFamily: 'Oxanium'),
                ),
                trailing: IconButton(
                    splashRadius: 25,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon:
                        const Icon(Icons.close, color: Colors.white, size: 28)),
              ),
            ),
          ),
          const CustomDivider(),
          const SizedBox(height: 20),
          const _ListTileOption(
            text: 'Estándar',
            icon: FaIcon(FontAwesomeIcons.calculator,
                color: Colors.white, size: 28),
            screen: 'standar',
          ),
          const _ListTileOption(
              text: ' Científica',
              icon: Icon(
                Icons.science,
                color: Colors.white,
                size: 30,
              ),
              screen: 'scientific'),
        ],
      ),
    );
  }
}

class _ListTileOption extends StatelessWidget {
  const _ListTileOption(
      {super.key,
      required this.text,
      required this.icon,
      required this.screen});

  final String text;
  final dynamic icon;
  final String screen;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<InputProvider>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: text == 'Estándar' ? const EdgeInsets.only(left: 5) : null,
      // color: Colors.red,
      child: ListTile(
        leading: icon,
        title: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 25, fontFamily: 'Oxanium'),
        ),
        onTap: () {
          if (provider.currentScreen == screen) {
            return Navigator.pop(context);
          }

          Navigator.pushReplacementNamed(context, screen);
          provider.currentScreen = screen;
          Preferences.screen = screen;
        },
      ),
    );
  }
}
