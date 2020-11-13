import 'package:e_voting/components/signInHeader.dart';
import 'package:e_voting/components/signInNav.dart';
import 'package:flutter/material.dart';

class SignInStep4Page extends StatefulWidget {

  @override
  _SignInStep4PageState createState() => _SignInStep4PageState();
}

class _SignInStep4PageState extends State<SignInStep4Page> {
  String telNumberValue = "+53";

  @override
  Widget build(BuildContext context) {

    final telTypeInput = Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12)
      ),
      child: DropdownButton<String>(
        value: telNumberValue,
        hint: Text(telNumberValue),
        icon: Icon(Icons.keyboard_arrow_down,color: Colors.white, size: 24),
        style: TextStyle(color: Colors.white),
        dropdownColor: Theme.of(context).primaryColor,
        underline: Container(
          height: 0,
        ),
        onChanged: (String newValue) {
          setState(() {
            telNumberValue = newValue;
          });
        },
        items: <String>["+53", '+52', '+51'].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );

    final telNumberInput = Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          hintText: '3065197565',
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
            telTypeInput,
            telNumberInput
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
              SignInHeader(title: "Paso 4", subtitle: "Tu número de identificación"),
              form,
              SignInNav('/signInStep5')
            ],
          ),
        ),
      ]),
    );

    return viewStructure;
  }
}
