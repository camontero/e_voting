import 'package:svec/components/signUpNav.component.dart';
import 'package:svec/components/signUpHeader.component.dart';
import 'package:flutter/material.dart';

class SignUpFinalStepPage extends StatelessWidget {
  static const routeName = '/signUpFinalStep';
  final Map<String, dynamic> signUpValues;
  SignUpFinalStepPage(this.signUpValues);

  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();


  String emailValidator(value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (regExp.hasMatch(value)) {
      return null;
    } else if (value.isEmpty) {
      return 'Por favor digite su correo electrónico';
    } else {
      return 'Algo anda mal, por favor verifica tus datos';
    }
  }

  String passwordValidator(value) {
    String pattern = r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    if (regExp.hasMatch(value)) {
      return null;
    } else if (value.isEmpty) {
      return 'Por favor digita tu contraseña';
    } else {
      return 'Tu contraseña debe de ser de mínimo 8 caracteres incluidas mayúsculas, minúsculas y números';
    }
  }

  String password2Validator(value) {
    if (passwordController.text == value) {
      return null;
    } else if (value.isEmpty) {
      return 'Por favor digita tu contraseña';
    } else {
      return 'La contraseña digitada no coincide con la anterior';
    }
  }


  @override
  Widget build(BuildContext context) {

    signUpValues['key'] = _formKey;

    final emailInput = Container(
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Correo electrónico',
          icon: Icon(Icons.account_box, size: 36.0),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300])),
          hintStyle: TextStyle(color: Colors.grey),
        ),
        onSaved: (value) => signUpValues['email'] = value.trim(),
        validator: (value) => emailValidator(value),
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
          errorMaxLines: 2
        ),
        controller: passwordController,
        // obscureText: true,
        onSaved: (value) => signUpValues['password'] = value.trim(),
        validator: (value) => passwordValidator(value),
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
        // obscureText: true,
        validator: (value) => password2Validator(value),
      ),
    );

    final form = Container(
      margin: EdgeInsets.symmetric(vertical: 40.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            emailInput,
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
              SignUpHeader(title: "Paso 5", subtitle: "Introduce tus datos"),
              form,
              SignUpNav(pageToGo: '/home', signUpValues: signUpValues)
            ],
          ),
        ),
      ]),
    );

    return viewStructure;
  }
}
