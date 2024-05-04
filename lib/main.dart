import 'package:flutter/material.dart';
import 'package:rubik/theme.dart';
import 'package:rubik/startseite.dart';

void main() {
  runApp(RubicApp());
}

class RubicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: Startseite(),
    );
  }
}

void navigateTo(Widget destinationPage, BuildContext context) {
  final MaterialPageRoute route = MaterialPageRoute(builder: (_) => destinationPage);
  Navigator.push(context, route);
}
