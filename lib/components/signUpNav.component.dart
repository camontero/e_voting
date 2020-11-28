import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:svec/models/user.model.dart';
import 'package:provider/provider.dart';
import 'package:svec/services/auth.service.dart';

class SignUpNav extends StatelessWidget {
  final String pageToGo;
  final Map<String, dynamic> signUpValues;

  SignUpNav(
      {@required this.pageToGo,
      @required this.signUpValues});

  @override
  Widget build(BuildContext context) {

    void nextController() {
      if (signUpValues['key'].currentState.validate()) {
        signUpValues['key'].currentState.save();
        if (pageToGo != "/home") {
          print(signUpValues);
          Navigator.of(context).pushNamed(pageToGo, arguments: signUpValues);
        } else {
          UserModel user = UserModel(
            name: signUpValues['name'],
            lastname: signUpValues['lastname'],
            email: signUpValues['email'],
            password: signUpValues['password'],
            dniType: signUpValues['dniType'],
            dniNumber: signUpValues['dniNumber'],
            telType: signUpValues['telType'],
            telNumber: signUpValues['telNumber'],
          );

          context.read<AuthService>().signUp(newUser: user).then((value) {
            print(value);
          });
          context.read<AuthService>().signUpProfile(newUser: user).then((value) {
            print(value);
          });

          Navigator.of(context)
              .pushNamedAndRemoveUntil(pageToGo, (route) => false);
        }
      }
    }

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
          onPressed: () => Navigator.of(context).pop(),
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
        onPressed: () => nextController(),
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
