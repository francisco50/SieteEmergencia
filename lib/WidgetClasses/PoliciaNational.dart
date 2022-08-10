import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/LlamarUI.dart';
import '../Widgets/LogoIconAndService.dart';
import '../declarations/text_info.dart';
import 'getNumber.dart';

class PoliciaNational extends StatefulWidget {
  @override
  State<PoliciaNational> createState() => _PoliciaNationalState();
}

class _PoliciaNationalState extends State<PoliciaNational> {

  //document IDs
  List<String> docIDs = [];

  Future getDocId() async {
    docIDs.clear();
    await FirebaseFirestore.instance.collection('Policias').get().then(
          (value) => value.docs.forEach((element) {
        print(element.reference);
        docIDs.add(element.reference.id);
      }),
    );
  }

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
                icon: Icons.local_police,
                text: 'Police',
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: const Radius.circular(15.0), topRight: const Radius.circular(15.0)),
      ),
      context: context,
      builder: (BuildContext bc) {
        return Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getDocId(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: docIDs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: GetNumber(documentId: docIDs[index], Institution: 'Policia', Collection: 'Policias',),
                            tileColor: Colors.red[700],
                          ),
                        );
                      },
                    );
                  }),
            ),
            // TextInfo(
            //     size: 20.0, moneyText: 'Policia Nacional', color: Colors.black),
            // LlamarUI(
            //   NombreDeBario: 'Ela Nguema',
            //   NumberDeMovil: '1111111111',
            // ),
            // LlamarUI(
            //   NombreDeBario: 'Semu',
            //   NumberDeMovil: '22222222222',
            // ),
            // LlamarUI(
            //   NombreDeBario: 'Basupu',
            //   NumberDeMovil: '333333333333',
            // ),
            // LlamarUI(
            //   NombreDeBario: 'Nuevo Estadio',
            //   NumberDeMovil: '4444444444',
            // ),
            // LlamarUI(
            //   NombreDeBario: 'Los Angeles',
            //   NumberDeMovil: '555555555555',
            // ),
          ],
        );
      },
    );
  }
}
