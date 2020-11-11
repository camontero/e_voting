import '../components/registerNavButtons.dart';
import 'package:flutter/material.dart';

class RegisterStep2 extends StatelessWidget {
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
        "Paso 2",
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

    final passwordInput = Container(
      margin: EdgeInsets.only(top: 35.0),
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
              RegisterNavButtons('/registerStep3')
            ],
          ),
        ),
      ]),
    );

    return viewStructure;
  }
}
