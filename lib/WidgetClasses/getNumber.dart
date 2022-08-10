import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class GetNumber extends StatelessWidget {
  final String documentId;
  final String Institution;
  final String Collection;
  GetNumber({required this.documentId, required this.Institution, required this.Collection});


  @override
  Widget build(BuildContext context) {
    CollectionReference number =
        FirebaseFirestore.instance.collection(Collection);
    return FutureBuilder<DocumentSnapshot>(
        future: number.doc(documentId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: () {
                      _callNumber('${data[Institution]}');
                    },
                    icon: Icon(
                      Icons.call,
                      size: 25,
                      color: Colors.red,
                    ),
                    label: Text('${data['Name']}'),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                  height: 10.0,
                ),
                // Expanded(
                //   child: ElevatedButton.icon(
                //     onPressed: () {
                //       _callNumber('${data['Hospital']}');
                //     },
                //     icon: Icon(
                //       Icons.message,
                //       size: 18,
                //     ),
                //     label: Text('Mensaje'),
                //   ),
                // ),
              ],
            );
            // child: Text('Number: ${data['Hospital Lapaz']}'));
          }
          return Text('9999999');
        });
  }
}

_callNumber(String phoneNumber) async {
  String number = phoneNumber;
  await FlutterPhoneDirectCaller.callNumber(number);
}
