import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/LlamarUI.dart';
import '../Widgets/LogoIconAndService.dart';
import '../declarations/text_info.dart';

class Chivatos extends StatefulWidget {
  @override
  State<Chivatos> createState() => _ChivatosState();
}

class _ChivatosState extends State<Chivatos> {
  //final Function BoxService;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              _callEmergency(context);
            },
            child: Container(
              width: 170,
              height: 130,
              child: logoIconAndService(
                icon: Icons.emergency,
                text: 'Emergencia',
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ), //BoxDecoration
            ),
          ),
        ],
      ),
    );
  }

  void _callEmergency(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Column(
          children: [
            TextInfo(
                size: 20.0, moneyText: 'Policia Nacional', color: Colors.black),
            LlamarUI(
              NombreDeBario: 'Ela Nguema',
              NumberDeMovil: '1111111111',
            ),
            LlamarUI(
              NombreDeBario: 'Semu',
              NumberDeMovil: '22222222222',
            ),
            LlamarUI(
              NombreDeBario: 'Basupu',
              NumberDeMovil: '333333333333',
            ),
            LlamarUI(
              NombreDeBario: 'Nuevo Estadio',
              NumberDeMovil: '4444444444',
            ),
            LlamarUI(
              NombreDeBario: 'Los Angeles',
              NumberDeMovil: '555555555555',
            ),
          ],
        );
      },
    );
  }
}
