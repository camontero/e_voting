import 'package:flutter/foundation.dart';

class UserModel {

  String password;
  String email;
  String name;
  String lastname;
  String dniType;
  String dniNumber;
  String telType;
  String telNumber;


  UserModel({
    @required this.name,
    @required this.lastname,
    @required this.email,
    @required this.password,
    @required this.dniType,
    @required this.dniNumber,
    @required this.telType,
    @required this.telNumber,
  });
}
