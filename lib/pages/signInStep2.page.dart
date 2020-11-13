import 'package:e_voting/components/signInHeader.dart';

import 'package:e_voting/components/signInNav.dart';
import 'package:flutter/material.dart';

class SignInStep2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final passwordInput = Container(
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Crea tu contraseña',
          icon: Icon(Icons.lock, size: 36.0),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300])),
          hintStyle: TextStyle(color: Colors.grey),
        ),
        obscureText: true,
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );

    final confirmPasswordInput = Container(
      margin: EdgeInsets.only(top: 35.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Confirma tu contraseña',
          icon: Icon(Icons.lock, size: 36.0),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300])),
          hintStyle: TextStyle(color: Colors.grey),
        ),
        obscureText: true,
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );

    final form = Container(
      margin: EdgeInsets.symmetric(vertical: 40.0),
      child: Form(
        // key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            passwordInput,
            confirmPasswordInput,
          ],
        ),
      ),
    );

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
              SignInHeader(title: "Paso 2", subtitle: "Introduce tus datos"),
              form,
              SignInNav('/signInStep3')
            ],
          ),
        ),
      ]),
    );

    return viewStructure;
  }
}
