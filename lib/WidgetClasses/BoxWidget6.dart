import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sieteemergencia/Widgets/LlamarUI.dart';


import '../declarations/text_info.dart';

class BoxWidget6 extends StatefulWidget {
  @override
  State<BoxWidget6> createState() => _BoxWidget6State();
}

class _BoxWidget6State extends State<BoxWidget6> {
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
        ); //LlamarWidget();
      },
    );
  }
}
