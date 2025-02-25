import 'package:flutter/material.dart';

void navigateTo(Widget destinationPage, BuildContext context) {
  final MaterialPageRoute route =
      MaterialPageRoute(builder: (_) => destinationPage);
  Navigator.push(context, route);
}
