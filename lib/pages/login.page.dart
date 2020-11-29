import 'package:svec/components/signUpHeader.component.dart';
import 'package:flutter/material.dart';
import 'package:svec/services/auth.service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {

  static const routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _emailValue;
  String _passwordValue;

  final _formKey = GlobalKey<FormState>();

  String emailValidator(value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);

    if (regExp.hasMatch(value)) {
      return null;
    } else if (value.isEmpty) {
      return 'Por favor digita tu correo electrónico';
    } else {
      return 'Algo anda mal, por favor verifica tus datos';
    }
  }

  String passwordValidator(value) {
    String pattern = r'^.{6,}$';
    RegExp regExp = new RegExp(pattern);
    if (regExp.hasMatch(value)) {
      return null;
    } else if (value.isEmpty) {
      return 'Por favor digita tu contraseña';
    } else {
      return 'Algo anda mal, por favor verifica tus datos';
    }
  }

  @override
  Widget build(BuildContext context) {
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
        onSaved: (value) => _emailValue = value.trim(),
        validator: (value) => emailValidator(value),
      ),
    );

    final passwordInput = Container(
      margin: EdgeInsets.symmetric(vertical: 35.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Contraseña',
          icon: Icon(Icons.lock, size: 36.0),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300])),
          hintStyle: TextStyle(color: Colors.grey),
        ),
        obscureText: true,
        onSaved: (value) => _passwordValue = value.trim(),
        validator: (value) => passwordValidator(value),
      ),
    );

    final loginButton = Container(
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        splashColor: Colors.red,
        padding: EdgeInsets.fromLTRB(0, 14, 0, 14),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();

            context
                .read<AuthService>()
                .login(
                  email: _emailValue,
                  password: _passwordValue,
                )
                .then((value) {
              if (value == true) {
                Navigator.of(context).pushNamed('/home');
              } else {
                // TODO: Agregar pop up de que algo pasó
              }
            });
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  'Ingresar',
                  style: TextStyle(fontSize: 16),
                )),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Icon(Icons.arrow_forward)),
          ],
        ),
      ),
    );

    final form = Container(
      margin: EdgeInsets.only(top: 40.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[emailInput, passwordInput, loginButton],
        ),
      ),
    );

    final forgetPassButton = Center(
      child:
          FlatButton(onPressed: null, child: Text("¿Olvidaste tu contraseña?")),
    );

    final signUpButton = Center(
      child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          splashColor: Colors.red,
          padding: EdgeInsets.fromLTRB(0, 14, 0, 14),
          onPressed: () => Navigator.of(context).pushNamed('/signUpStep1'),
          child: Center(
            child: Text(
              'Registrarme',
              style: TextStyle(fontSize: 16),
            ),
          )),
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
                  title: "¡Inicia sesión!", subtitle: "Ingresa para continuar"),
              form,
              forgetPassButton,
              signUpButton
            ],
          ),
        ),
      ]),
    );

    return viewStructure;
  }
}
