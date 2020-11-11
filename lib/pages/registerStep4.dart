import '../components/registerNavButtons.dart';
import 'package:flutter/material.dart';

class RegisterStep4 extends StatefulWidget {

  @override
  _RegisterStep4State createState() => _RegisterStep4State();
}

class _RegisterStep4State extends State<RegisterStep4> {
  String dropdownValue = 'CC';

  @override
  Widget build(BuildContext context) {
    final decorationRectangle = Container(
      width: 45.0,
      height: 45.0,
      margin: EdgeInsets.only(
        top: 80.0,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
    );

    final title = Container(
      margin: EdgeInsets.only(
        top: 25.0,
      ),
      child: Text(
        "Paso 4",
        style: TextStyle(color: Colors.black, fontSize: 42),
      ),
    );

    final subtitle = Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Text(
        "Tu número de identificación",
        style: TextStyle(color: Colors.grey, fontSize: 24),
      ),
    );


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
          padding: EdgeInsets.only(
            left: 40.0,
            right: 40.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              decorationRectangle,
              title,
              subtitle,
              form,
              RegisterNavButtons('/registerStep5')
            ],
          ),
        ),
      ]),
    );

    return viewStructure;
  }
}
