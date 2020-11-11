import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
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
        "¡Inicia sesión!",
        style: TextStyle(color: Colors.black, fontSize: 42),
      ),
    );

    final subtitle = Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Text(
        "Ingresa para continuar",
        style: TextStyle(color: Colors.grey, fontSize: 24),
      ),
    );

    final usernameInput = Container(
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
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );

    final submitButton = Container(
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        splashColor: Colors.red,
        padding: EdgeInsets.fromLTRB(0, 14, 0, 14),
        onPressed: () {
          // Validate will return true if the form is valid, or false if
          // the form is invalid.
          // if (_formKey.currentState.validate()) {
          //   // Process data.
          // }
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
        // key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[usernameInput, passwordInput, submitButton],
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
          onPressed: () {
            // Validate will return true if the form is valid, or false if
            // the form is invalid.
            // if (_formKey.currentState.validate()) {
            //   // Process data.
            // }
            Navigator.of(context).pushNamed('/registerStep1');
          },
          child: Center(
            child: Text(
              'Registrarme',
              style: TextStyle(fontSize: 16),
            ),
          )),
    );
    final viewStructure = Scaffold(
      // appBar: AppBar(
      //   shadowColor: Colors.transparent,
      //   backgroundColor: Colors.deepPurple,
      //   title: Text("Share"),
      //   leading: GestureDetector(
      //     onTap: () {},
      //     child: IconButton(
      //       icon: Icon(Icons.navigate_before),
      //       tooltip: 'Return',
      //       onPressed: () {
      //       },
      //     ),
      //   ),
      // ),
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
