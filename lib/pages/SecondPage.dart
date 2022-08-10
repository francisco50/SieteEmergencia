import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sieteemergencia/declarations/text_info.dart';

// Amplify Flutter Packages

import '../Widgets/RedButton.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20.0),
              child: Center(
                child: TextInfo(
                  size: 20.0,
                  moneyText: 'PRESS FOR EMERGENCY',
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 10.0,
            ),
            Container(
              child: RedButtonWidget(
                image: Image.asset('assets/images/newimj.png'),
              ),
              //height: animation.value * 500,
            ),

          ]),
    );
  }
}
