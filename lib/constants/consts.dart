import 'package:fl_calculator/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Constants {
  static const standarButtons = [
    FloatingActionButtonCustom(
        content:
            Text('C', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
        color: Color.fromARGB(255, 105, 36, 36),
        value: 'C'),
    FloatingActionButtonCustom(
        content:
            Text('()', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
        color: Color.fromARGB(255, 59, 99, 97),
        value: '()'),
    FloatingActionButtonCustom(
        content: FaIcon(FontAwesomeIcons.percent, size: 27),
        color: Color.fromARGB(255, 59, 99, 97),
        value: '%'),
    FloatingActionButtonCustom(
        content: FaIcon(FontAwesomeIcons.divide, size: 30),
        color: Color.fromARGB(255, 59, 99, 97),
        value: '/'),
    FloatingActionButtonCustom(
        content:
            Text('7', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
        value: '7'),
    FloatingActionButtonCustom(
        content:
            Text('8', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
        value: '8'),
    FloatingActionButtonCustom(
        content:
            Text('9', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
        value: '9'),
    FloatingActionButtonCustom(
        content: FaIcon(FontAwesomeIcons.xmark, size: 30),
        color: Color.fromARGB(255, 59, 99, 97),
        value: 'x'),
    FloatingActionButtonCustom(
        content:
            Text('4', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
        value: '4'),
    FloatingActionButtonCustom(
        content:
            Text('5', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
        value: '5'),
    FloatingActionButtonCustom(
        content:
            Text('6', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
        value: '6'),
    FloatingActionButtonCustom(
        content: FaIcon(FontAwesomeIcons.minus, size: 30),
        color: Color.fromARGB(255, 59, 99, 97),
        value: '-'),
    FloatingActionButtonCustom(
        content:
            Text('1', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
        value: '1'),
    FloatingActionButtonCustom(
        content:
            Text('2', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
        value: '2'),
    FloatingActionButtonCustom(
        content:
            Text('3', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
        value: '3'),
    FloatingActionButtonCustom(
        content: FaIcon(FontAwesomeIcons.plus, size: 30),
        color: Color.fromARGB(255, 59, 99, 97),
        value: '+'),
    FloatingActionButtonCustom(
        content:
            Text('+/-', style: TextStyle(fontSize: 30, fontFamily: 'Oxanium')),
        color: Color(0xff212121),
        value: '+/-'),
    FloatingActionButtonCustom(
        content:
            Text('0', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
        value: '0'),
    FloatingActionButtonCustom(
        content:
            Text('.', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
        value: '.'),
    FloatingActionButtonCustom(
        content: FaIcon(FontAwesomeIcons.equals, size: 30),
        color: Color.fromARGB(255, 50, 131, 127),
        value: '='),
  ];

  static const List<Widget> scientificButtons = [
    FloatingActionButtonCustom2(
      content: Text('C', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
      value: 'C',
      color: Color.fromARGB(255, 105, 36, 36),
    ),
    FloatingActionButtonCustom2(
      content: Text('(', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
      value: '(',
      color: Color.fromARGB(255, 59, 99, 97),
    ),
    FloatingActionButtonCustom2(
      content: Text(')', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
      value: ')',
      color: Color.fromARGB(255, 59, 99, 97),
    ),
    FloatingActionButtonCustom2(
      content:
          Text('exp', style: TextStyle(fontSize: 15.5, fontFamily: 'Oxanium')),
      value: 'exp',
      color: Color.fromARGB(255, 59, 99, 97),
    ),
    FloatingActionButtonCustom2(
      content: FaIcon(FontAwesomeIcons.percent, size: 27),
      value: '%',
      color: Color.fromARGB(255, 59, 99, 97),
    ),
    FloatingActionButtonCustom2(
      content:
          Text('sin', style: TextStyle(fontSize: 19.6, fontFamily: 'Oxanium')),
      value: 'sin',
      color: Color.fromARGB(255, 37, 54, 56),
    ),
    FloatingActionButtonCustom2(
      content:
          Text('cos', style: TextStyle(fontSize: 16.39, fontFamily: 'Oxanium')),
      value: 'cos',
      color: Color.fromARGB(255, 37, 54, 56),
    ),
    FloatingActionButtonCustom2(
      content:
          Text('tan', style: TextStyle(fontSize: 17, fontFamily: 'Oxanium')),
      value: 'tan',
      color: Color.fromARGB(255, 37, 54, 56),
    ),
    FloatingActionButtonCustom2(
      content:
          Text('log', style: TextStyle(fontSize: 18, fontFamily: 'Oxanium')),
      value: 'log',
      color: Color.fromARGB(255, 37, 54, 56),
    ),
    FloatingActionButtonCustom2(
      content: FaIcon(FontAwesomeIcons.divide, size: 30),
      value: '/',
      color: Color.fromARGB(255, 59, 99, 97),
    ),
    FloatingActionButtonCustom2(
      content:
          Text('pi', style: TextStyle(fontSize: 17, fontFamily: 'Oxanium')),
      value: 'pi',
      color: Color.fromARGB(255, 37, 54, 56),
    ),
    FloatingActionButtonCustom2(
        content:
            Text('7', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
        value: '7'),
    FloatingActionButtonCustom2(
        content:
            Text('8', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
        value: '8'),
    FloatingActionButtonCustom2(
        content:
            Text('9', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
        value: '9'),
    FloatingActionButtonCustom2(
      content: FaIcon(FontAwesomeIcons.xmark, size: 30),
      value: 'x',
      color: Color.fromARGB(255, 59, 99, 97),
    ),
    FloatingActionButtonCustom2(
      content:
          Text('rad', style: TextStyle(fontSize: 17, fontFamily: 'Oxanium')),
      value: 'rad',
      color: Color.fromARGB(255, 37, 54, 56),
    ),
    FloatingActionButtonCustom2(
        content:
            Text('4', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
        value: '4'),
    FloatingActionButtonCustom2(
        content:
            Text('5', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
        value: '5'),
    FloatingActionButtonCustom2(
        content:
            Text('6', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
        value: '6'),
    FloatingActionButtonCustom2(
      content: FaIcon(FontAwesomeIcons.minus, size: 30),
      value: '-',
      color: Color.fromARGB(255, 59, 99, 97),
    ),
    FloatingActionButtonCustom2(
      content:
          Text('|x|', style: TextStyle(fontSize: 24, fontFamily: 'Oxanium')),
      value: '|x|',
      color: Color.fromARGB(255, 37, 54, 56),
    ),
    FloatingActionButtonCustom2(
        content:
            Text('1', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
        value: '1'),
    FloatingActionButtonCustom2(
        content:
            Text('2', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
        value: '2'),
    FloatingActionButtonCustom2(
        content:
            Text('3', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
        value: '3'),
    FloatingActionButtonCustom2(
      content: FaIcon(FontAwesomeIcons.plus, size: 30),
      value: '+',
      color: Color.fromARGB(255, 59, 99, 97),
    ),
    FloatingActionButtonCustom2(
      content: Text('e', style: TextStyle(fontSize: 25, fontFamily: 'Oxanium')),
      value: 'e',
      color: Color.fromARGB(255, 37, 54, 56),
    ),
    FloatingActionButtonCustom2(
        content: Text('+/-',
            style: TextStyle(fontSize: 19.5, fontFamily: 'Oxanium')),
        value: '+/-'),
    FloatingActionButtonCustom2(
        content:
            Text('0', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
        value: '0'),
    FloatingActionButtonCustom2(
        content:
            Text('.', style: TextStyle(fontSize: 35, fontFamily: 'Oxanium')),
        value: '.'),
    FloatingActionButtonCustom2(
      content: FaIcon(FontAwesomeIcons.equals, size: 30),
      value: '=',
      color: Color.fromARGB(255, 59, 99, 97),
    ),
  ];
}
