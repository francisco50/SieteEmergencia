import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../declarations/text_info.dart';

class logoIconAndService extends StatelessWidget {
  final IconData icon;
  final String text;

  logoIconAndService({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.only(right: 20.0, left: 5.0),
      child: Column(
        children: [
          TextInfo(size: 20.0, moneyText: text, color: Colors.black),
          Icon(
            icon,
            size: 60.0,
          )
        ],
      ),
    );
  }
}
