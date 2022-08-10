import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInfo extends StatelessWidget {
  TextInfo({
    required this.size,
    required this.moneyText,
    required this.color,
  });
  final double size;
  final String moneyText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      moneyText,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'Kanit',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
