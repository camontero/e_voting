import '../components/registerNavButtons.dart';
import 'package:flutter/material.dart';

class RegisterStep1 extends StatelessWidget {
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
        "Paso 1",
        style: TextStyle(color: Colors.black, fontSize: 42),
      ),
    );

    final subtitle = Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Text(
        "Introduce tus datos",
        style: TextStyle(color: Colors.grey, fontSize: 24),
      ),
    );

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
              RegisterNavButtons('/registerStep2')
            ],
          ),
        ),
      ]),
    );

    return viewStructure;
  }
}
