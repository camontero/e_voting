import 'package:svec/components/signUpHeader.component.dart';
import 'package:svec/components/signUpNav.component.dart';
import 'package:flutter/material.dart';

class SignUpStep3Page extends StatefulWidget {
  static const routeName = '/signUpStep3';
  final Map<String, dynamic> signUpValues;

  SignUpStep3Page(this.signUpValues);

  @override
  _SignUpStep3PageState createState() => _SignUpStep3PageState();
}

class _SignUpStep3PageState extends State<SignUpStep3Page> {
  final _formKey = GlobalKey<FormState>();
  String telTypeValue = "+53";

  String telNumberValidator(String value) {

    if (value.isNotEmpty) {
      return null;
    } else if (value.isEmpty) {
      return 'Por favor digita tu número de celular';
    } else {
      return 'Algo anda mal, por favor verifica tus datos';
    }
  }

  @override
  Widget build(BuildContext context) {
    this.widget.signUpValues['key'] = _formKey;
    this.widget.signUpValues['telType'] = telTypeValue;

    final telTypeInput = Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(12)),
      child: DropdownButton<String>(
        value: telTypeValue,
        hint: Text(telTypeValue),
        icon: Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 24),
        style: TextStyle(color: Colors.white),
        dropdownColor: Theme.of(context).primaryColor,
        underline: Container(
          height: 0,
        ),
        onChanged: (value) {
          setState(() {
            telTypeValue = value;
          });
          this.widget.signUpValues['telType'] = telTypeValue;
        },
        items: <String>["+53", '+52', '+51']
            .map<DropdownMenuItem<String>>((value) {
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
        keyboardType: TextInputType.number,
        onSaved: (value) =>
            this.widget.signUpValues['telNumber'] = value.trim().replaceAll(RegExp(r'[\,\.]'), ""),
        validator: (value) => telNumberValidator(value),
      ),
    );

    final form = Container(
      margin: EdgeInsets.symmetric(vertical: 40.0),
      child: Form(
        key: _formKey,
        child: Row(
          children: <Widget>[telTypeInput, telNumberInput],
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
              SignUpHeader(
                  title: "Paso 3", subtitle: "Tu número de identificación"),
              form,
              SignUpNav(
                  pageToGo: '/signUpStep4',
                  prevPage: '/signUpStep2',
                  signUpValues: this.widget.signUpValues)
            ],
          ),
        ),
      ]),
    );

    return viewStructure;
  }
}
