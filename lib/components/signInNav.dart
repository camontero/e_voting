import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignInNav extends StatelessWidget {
  String pageToGo;

  SignInNav(this.pageToGo);

  @override
  Widget build(BuildContext context) {
    final prevButton = Container(
      margin: EdgeInsets.only(right: 15.0),
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
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back)),
    );

    final nextButton = Expanded(
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        splashColor: Colors.red,
        padding: EdgeInsets.fromLTRB(10, 14, 10, 14),
        onPressed: () {
          // Validate will return true if the form is valid, or false if
          // the form is invalid.
          // if (_formKey.currentState.validate()) {
          //   // Process data.
          // }
          if (this.pageToGo != "/home") {
            Navigator.of(context).pushNamed(this.pageToGo);
          } else {
            Navigator.of(context).pushNamedAndRemoveUntil(this.pageToGo, (route) => false);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  'Siguiente',
                  style: TextStyle(fontSize: 16),
                )),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Icon(Icons.arrow_forward)),
          ],
        ),
      ),
    );

    return Row(
      children: [prevButton, nextButton],
    );
  }
}
