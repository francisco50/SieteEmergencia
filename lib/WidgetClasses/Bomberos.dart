import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/LlamarUI.dart';
import '../Widgets/LogoIconAndService.dart';
import '../declarations/text_info.dart';
import 'getNumber.dart';

class Bomberos extends StatefulWidget {
  @override
  State<Bomberos> createState() => _BomberosState();
}

class _BomberosState extends State<Bomberos> {

  //document IDs
  List<String> docIDs = [];


  Future getDocId() async {
    docIDs.clear();
    await FirebaseFirestore.instance.collection('Bomberos').get().then(
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
                icon: Icons.fire_extinguisher,
                text: 'Bomberos',
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
                            title: GetNumber(documentId: docIDs[index], Institution: 'Bomberos', Collection: 'Bomberos',),
                            tileColor: Colors.red[700],
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
