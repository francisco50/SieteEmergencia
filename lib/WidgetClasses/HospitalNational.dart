import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../Widgets/LlamarUI.dart';
import '../Widgets/LogoIconAndService.dart';
import '../declarations/text_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'getNumber.dart';

class HospitalNational extends StatefulWidget {
  @override
  State<HospitalNational> createState() => _HospitalNationalState();


}

class _HospitalNationalState extends State<HospitalNational> {


  //document IDs
  List<String> docIDs = [];


  Future getDocId() async {
    docIDs.clear();
    await FirebaseFirestore.instance.collection('Hospitales').get().then(
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
              //getNumbers(num2);
              _callEmergency(context);
            },
            child: Container(
              width: 170,
              height: 130,
              child: logoIconAndService(
                icon: Icons.local_hospital,
                text: 'Hospital',
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

  Future<void> _callEmergency(context) async {

    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          //String num;
          //getNumbers();

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
                              title: GetNumber(documentId: docIDs[index], Institution: 'Hospital', Collection: 'Hospitales',),
                              tileColor: Colors.red[700],
                            ),
                          );
                        },
                      );
                    }),
              ),
            ],
          );
        });
  }
}
