import 'package:e_voting/components/signInNav.component.dart';
import 'package:e_voting/components/signInHeader.component.dart';
import 'package:flutter/material.dart';

class SignInStep1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final namesInput = Container(
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Nombres',
          icon: Icon(Icons.account_box, size: 36.0),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300])),
          hintStyle: TextStyle(color: Colors.grey),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );

    final lastNamesInput = Container(
      margin: EdgeInsets.only(top: 35.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Apellidos',
          icon: Icon(Icons.account_box, size: 36.0),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300])),
          hintStyle: TextStyle(color: Colors.grey),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );

    final usernameInput = Container(
      margin: EdgeInsets.only(top: 35.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Nombre de usuario',
          icon: Icon(Icons.account_box, size: 36.0),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300])),
          hintStyle: TextStyle(color: Colors.grey),
        ),
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
            namesInput,
            lastNamesInput,
            usernameInput,
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
              SignInHeader(title: "Paso 1", subtitle: "Introduce tus datos"),
              form,
              SignInNav('/signInStep2')
            ],
          ),
        ),
      ]),
    );

    return viewStructure;
  }
}
