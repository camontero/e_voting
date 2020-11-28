import 'package:svec/components/signUpHeader.component.dart';

import 'package:svec/components/signUpNav.component.dart';
import 'package:flutter/material.dart';

class SignUpStep4Page extends StatelessWidget {
  static const routeName = '/signUpStep4';
  final Map<String, dynamic> signUpValues;

  SignUpStep4Page(this.signUpValues);

  @override
  Widget build(BuildContext context) {
    final caption = Container(
        margin: EdgeInsets.only(top: 15.0, bottom: 40.0),
        child: Text(
          'Registra tu huella para verificar tu identidad',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ));

    final viewStructure = Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 80.0),
        padding: EdgeInsets.only(
          left: 40.0,
          right: 40.0,
        ),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SignUpHeader(title: "Paso 5", icon: Icons.fingerprint),
              caption,
              SignUpNav(pageToGo: '/signUpFinalStep', signUpValues: signUpValues)
            ],
          ),
          Container(
            height: 260,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
                child: Text(
              "Estamos en construcción, por favor continua",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(3.0, 3.0),
                      blurRadius: 5.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ]),
            )),
          )
        ]),
      ),
    );

    return viewStructure;
  }
}
