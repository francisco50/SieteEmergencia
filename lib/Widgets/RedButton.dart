import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../WidgetClasses/AbusoSexual.dart';
import '../WidgetClasses/Bomberos.dart';
import '../WidgetClasses/Chivatos.dart';
import '../WidgetClasses/CruzRoja.dart';
import '../WidgetClasses/TestList.dart';
import '../WidgetClasses/HospitalNational.dart';
import '../WidgetClasses/PoliciaNational.dart';
import '../declarations/text_info.dart';

class RedButtonWidget extends StatelessWidget {
  //RedButtonWidget redButtonWidget;

  final Image image;
  RedButtonWidget({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: InkWell(
          onTap: () {
            _emergencyScreen(context);
          },
          child: AvatarGlow(
            endRadius: 100,
            animate: true,
            showTwoGlows: true,
            child: Material(
              elevation: 8.0,
              shape: CircleBorder(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: CircleAvatar(
                  backgroundColor: Colors.red[300],
                  child: image,

                  radius: 40.0,
                ),
              ),
            ),
            glowColor: Colors.red,
            duration: Duration(milliseconds: 2000),
            repeatPauseDuration: Duration(milliseconds: 100),
          ),
        ),
      ),
    );
  }
}

void _emergencyScreen(context) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: const Radius.circular(30.0), topRight: const Radius.circular(30.0)),
    ),
    isScrollControlled: false,
    isDismissible: true,
    context: context,
    builder: (BuildContext bc) {
      return SingleChildScrollView(
        //
        //dragStartBehavior: DragStartBehavior.start,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.red,
                    size: 20,
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 120,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, top: 5.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: TextInfo(
                        size: 30,
                        moneyText: 'Emergencias',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              //TestListView(),
                              PoliciaNational(),
                              // Container
                              SizedBox(
                                width: 5,
                                height: 5,
                              ), //SizedBox
                              Bomberos(),
                              //Container
                            ],
                          ),
                          SizedBox(
                            width: 5,
                            height: 5,
                          ),
                          Row(
                            children: <Widget>[
                              HospitalNational(), //Container
                              SizedBox(
                                width: 5,
                                height: 5,
                              ), //SizedBox
                              CruzRoja(),
                              //Container
                            ],
                          ),
                          SizedBox(
                            width: 5,
                            height: 5,
                          ),
                          // Row(
                          //   children: <Widget>[
                          //     AbusoSexual(), //Container
                          //     SizedBox(
                          //       width: 5,
                          //       height: 5,
                          //     ), //SizedBox
                          //     Chivatos(),
                          //     //Container
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
