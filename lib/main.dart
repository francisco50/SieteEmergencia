import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sieteemergencia/pages/Company_Register.dart';
import 'package:sieteemergencia/pages/SecondPage.dart';
import 'firebase_options.dart';
import 'pages/Company_Login.dart';

Future<void> main() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new SecurityButton(),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}

class SecurityButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('7 M', style: TextStyle(
          color: Colors.black,
          fontSize: 40,
        ),),
        actions: [
          Row(
            children: [
              Text('Seguridad Privada', style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),),
              IconButton(
                icon: Icon(Icons.security, color: Colors.red,),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => CompanyLogin()),
                  // );
                },
              )
            ],

            // width: 30,
            // child: Icon(Icons.emergency_sharp),
          ),
          Icon(Icons.more_vert),
        ],
      ),

      body: SecondPage(),
    );
  }
}
