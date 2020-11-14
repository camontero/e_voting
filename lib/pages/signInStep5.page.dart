import 'package:e_voting/components/signInHeader.component.dart';

import 'package:e_voting/components/signInNav.component.dart';
import 'package:flutter/material.dart';

class SignInStep5Page extends StatefulWidget {
  @override
  _SignInStep5PageState createState() => _SignInStep5PageState();
}

class _SignInStep5PageState extends State<SignInStep5Page> {
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
              SignInHeader(title: "Paso 5", icon: Icons.fingerprint),
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
