import 'package:svec/components/signUpHeader.component.dart';

import 'package:svec/components/signInNav.component.dart';
import 'package:flutter/material.dart';

class SignUpStep5Page extends StatefulWidget {
  @override
  _SignUpStep5PageState createState() => _SignUpStep5PageState();
}

class _SignUpStep5PageState extends State<SignUpStep5Page> {
  String dropdownValue = 'CC';

  @override
  Widget build(BuildContext context) {


    final caption = Container(
        margin: EdgeInsets.only(top: 15.0, bottom: 40.0),
        child: Text(
          'Registra tu huella para verificar tu identidad',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey
          ),
        ));

    final viewStructure = Scaffold(
      body: ListView(children: [
        Container(
          margin: EdgeInsets.only(top: 80.0),
          padding: EdgeInsets.only(
            left: 40.0,
            right: 40.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SignUpHeader(title: "Paso 5", icon: Icons.fingerprint),
              caption,
              SignInNav('/home')
            ],
          ),
        ),
      ]),
    );

    return viewStructure;
  }
}
