import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestListView extends StatefulWidget {
  @override
  State<TestListView> createState() => _TestListViewState();
}

class _TestListViewState extends State<TestListView> {
  final user = FirebaseAuth.instance.currentUser;

  //document IDs
  List<String> docIDs = [];

  Future getDocId() async {
    await FirebaseFirestore.instance.collection('Instituciones').get().then(
          (value) => value.docs.forEach((element) {
            print(element.reference);
            docIDs.add(element.reference.id);
          }),
        );
  }

  @override
  void initState() {
    getDocId();
    super.initState();
  }

  void _callEmergency(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Column(
          children: [
            ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('name'),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: ()
              {
                _callEmergency(context);
              },
            )

          ],
        ),
      );
  }
}
