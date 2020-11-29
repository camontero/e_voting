import 'package:svec/components/signUpHeader.component.dart';

import 'package:svec/components/signUpNav.component.dart';
import 'package:flutter/material.dart';


class SignUpStep2Page extends StatefulWidget {

  static const routeName = '/signUpStep2';
  final Map<String, dynamic> signUpValues;
  SignUpStep2Page(this.signUpValues);



  @override
  _SignUpStep2PageState createState() => _SignUpStep2PageState();
}

class _SignUpStep2PageState extends State<SignUpStep2Page> {

  final _formKey = GlobalKey<FormState>();
  String dropdownValue = 'CC';



  String dniNumberValidator(String value) {
    if (value.isNotEmpty) {
      return null;
    } else if(value.isEmpty) {
      return 'Por favor digita tu número de identificación';
    }else{
      return 'Algo anda mal, por favor verifica tus datos';
    }
  }

  @override
  Widget build(BuildContext context) {

    this.widget.signUpValues['key'] = _formKey;
    this.widget.signUpValues['dniType'] = dropdownValue;

    final dniTypeInput = Container(
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
        onChanged: (value) {
          setState(() {
            dropdownValue = value;
          });
          this.widget.signUpValues['dniType'] = value;
        },
        items: <String>['CC', 'CE', 'TI'].map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );

    final dniNumberInput = Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          hintText: '10010987654',
          hintStyle: TextStyle(color: Colors.grey),
        ),
        keyboardType: TextInputType.number,
        onSaved: (value) => this.widget.signUpValues['dniNumber'] = value.trim().replaceAll(RegExp(r'[\,\.]'), ""),
        validator: (value) => dniNumberValidator(value),
      ),
    );


    final form = Container(
      margin: EdgeInsets.symmetric(vertical: 40.0),
      child: Form(
        key: _formKey,
        child: Row(
          children: <Widget>[
            dniTypeInput,
            dniNumberInput
          ],
        ),
      ),
    );

    final viewStructure = Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 80.0),
        padding: EdgeInsets.only(
          left: 40.0,
          right: 40.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SignUpHeader(title: "Paso 2", subtitle: "Tu número de identificación"),
            form,
            SignUpNav(pageToGo: '/signUpStep3',prevPage: '/signUpStep1', signUpValues: this.widget.signUpValues)
          ],
        ),
      ),
    );

    return viewStructure;
  }
}
