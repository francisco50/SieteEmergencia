import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../declarations/text_info.dart';

class LlamarUI extends StatelessWidget {
  final String NombreDeBario;
  final String NumberDeMovil;
  // final _numeroController = TextEditingController();
  // final _nameController = TextEditingController();

  LlamarUI({required this.NombreDeBario, required this.NumberDeMovil});

  final _firestore = FirebaseFirestore.instance;
  Future<void> getNumbers() async {
    final Instituciones = _firestore
        .collection('Instituciones')
        .doc('Hospitales');
    Instituciones
        .get()
        .then((DocumentSnapshot value) {
      final data = value.data() as Map<String, dynamic>;

      //This prints all the data in Hospitales
      print(data);

      //This prints all the phone number of Hospital Lapaz
      int num = data['Hospital Lapaz'];
      print(num);
    },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            _callNumber(NumberDeMovil);
          },
          child: Row(
            children: [
              Container(
                child: Align(
                  child: Icon(Icons.call),
                  alignment: Alignment.centerLeft,
                ),
                padding: const EdgeInsets.only(right: 20.0, left: 5.0),
                alignment: Alignment.centerRight,
                width: 40,
                height: 60,
                //color: Colors.black,
                decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.pink,
                      width: 2.0,
                      style: BorderStyle.solid,
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(30.0))),
              ),
              SizedBox(
                width: 50,
              ),
              TextInfo(size: 20, moneyText: NombreDeBario, color: Colors.red),
            ],
          ),
        ),
      ],
    );
  }
}

_callNumber(String phoneNumber) async {
  String number = phoneNumber;
  await FlutterPhoneDirectCaller.callNumber(number);
}
