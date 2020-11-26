import 'package:svec/components/signUpHeader.component.dart';

import 'package:svec/components/signInNav.component.dart';
import 'package:flutter/material.dart';

class SignUpStep3Page extends StatefulWidget {

  @override
  _SignUpStep3PageState createState() => _SignUpStep3PageState();
}

class _SignUpStep3PageState extends State<SignUpStep3Page> {
  String dropdownValue = 'CC';

  @override
  Widget build(BuildContext context) {

    final typeDniInput = Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12)
      ),
      child: DropdownButton<String>(
        value: dropdownValue,
        hint: Text(dropdownValue),
        icon: Icon(Icons.keyboard_arrow_down,color: Colors.white, size: 24),
        style: TextStyle(color: Colors.white),
        dropdownColor: Theme.of(context).primaryColor,
        underline: Container(
          height: 0,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['CC', 'CE', 'TI'].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );

    final dniInput = Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          hintText: '10010987654',
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
        child: Row(
          children: <Widget>[
            typeDniInput,
            dniInput
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
              SignUpHeader(title: "Paso 3", subtitle: "Tu número de identificación"),
              form,
              SignInNav('/signInStep4')
            ],
          ),
        ),
      ]),
    );

    return viewStructure;
  }
}
