import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sieteemergencia/WidgetClasses/firebaseDatabase.dart';
import 'package:sieteemergencia/WidgetClasses/getNumber.dart';
import 'package:sieteemergencia/Widgets/LlamarUI.dart';

import '../Widgets/LogoIconAndService.dart';

class AbusoSexual extends StatefulWidget {
  @override
  State<AbusoSexual> createState() => _AbusoSexualState();
}

class _AbusoSexualState extends State<AbusoSexual> {
  final user = FirebaseAuth.instance.currentUser;
  late final FirebaseDatabase firebaseDatabase;

  //document IDs
  List<String> docIDs = [];


  Future getDocId() async {
    docIDs.clear();
    await FirebaseFirestore.instance.collection('Abuso Sexual').get().then(
          (value) => value.docs.forEach((element) {
            print(element.reference);
            docIDs.add(element.reference.id);
          }),
        );
  }
  //
  // @override
  // void initState() {
  //   getDocId();
  //   super.initState();
  // }


  //final Function BoxService
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
                text: 'Abuso',
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

  //await Amplify.DataStore.save(newInfo);
  void _callEmergency(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Column(
          children: [
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
                            title: GetNumber(documentId: docIDs[index], Institution: 'Abuso', Collection: 'Abuso Sexual',),
                            tileColor: Colors.blue[700],
                          ),
                        );
                      },
                    );
                  }),
            ),
          ],
        );
      },
    );
  }
}

//
// InstitucionInfo newInfo =
// InstitucionInfo(id: "1", name: "Ela Nguema", numero: "232323232323");
