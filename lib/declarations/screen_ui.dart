import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constant.dart';

class PayPal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        width: 350.0,
        height: 80.0,
        decoration: BoxDecoration(
          color: Colors.blue.shade500,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
        ),
        child: PaypalWidget(),
      ),
    );
  }
}

class PaypalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      FontAwesomeIcons.paypal,
                      size: 30.0,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          'Do you want to get Paid ?',
                          style: kLabelTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                          width: 10.0,
                        ),
                        Text(
                          'Link Paypal Account',
                          style: kLabelTextStyle2,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(children: [
                    Padding(
                      child: IconButton(
                        //Icons.arrow_forward_ios_outlined,
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         PaypalPayment(onFinish: (number) async {
                          //       // final snackBar = SnackBar(
                          //       //   content: Text("Payment done Successfully"),
                          //       //   duration: Duration(seconds: 5),
                          //       //   action: SnackBarAction(
                          //       //     label: 'Close',
                          //       //     onPressed: () {
                          //       //       // Some code to undo the change.
                          //       //     },
                          //       //   ),
                          //       // );
                          //     }),
                          //   ),
                          // );
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                        iconSize: 40,
                        color: Colors.brown,
                        tooltip: 'Increase volume by 5',
                      ),
                      padding: EdgeInsets.only(left: 40.0),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
