import 'package:svec/components/signUpHeader.component.dart';
import 'package:svec/components/signUpNav.component.dart';
import 'package:flutter/material.dart';

class SignUpStep1Page extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  static const routeName = '/signUpStep1';
  final Map<String, dynamic> signUpValues = new Map();


   String namesValidator(String value) {
    String pattern =
        r'^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.]+$';
    RegExp regExp = new RegExp(pattern);
    if (regExp.hasMatch(value)) {
      return null;
    } else if(value.isEmpty) {
      return 'Por favor digita tu nombre completo';
    }else{
      return 'Algo anda mal, por favor verifica tus datos';
    }
  }

  String lastnamesValidator(String value) {
    String pattern =
        r'^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.]+$';
    RegExp regExp = new RegExp(pattern);
    if (regExp.hasMatch(value)) {
      return null;
    } else if(value.isEmpty) {
      return 'Por favor digita tus apellidos completos';
    }else{
      return 'Algo anda mal, por favor verifica tus datos';
    }
  }



  @override
  Widget build(BuildContext context) {

    signUpValues['key'] = _formKey;

     final namesInput = Container(
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Nombres',
          icon: Icon(Icons.account_box, size: 36.0),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300])),
          hintStyle: TextStyle(color: Colors.grey),
        ),
        onSaved: (String value) => signUpValues['name'] = value.trim(),
        validator: (String value) => namesValidator(value),
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
        onSaved: (value) => signUpValues['lastname'] = value.trim(),
        validator: (value) => lastnamesValidator(value),
      ),
    );



    final form = Container(
      margin: EdgeInsets.symmetric(vertical: 40.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            namesInput,
            lastNamesInput,
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
            SignUpHeader(title: "Paso 1", subtitle: "Introduce tus datos"),
            form,
            SignUpNav(pageToGo: '/signUpStep2',signUpValues: signUpValues)
          ],
        ),
      ),
    );

    return viewStructure;
  }
}
