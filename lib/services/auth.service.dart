import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:svec/models/user.model.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _db;

  AuthService(this._firebaseAuth, this._db);

  /// Changed to idTokenChanges as it updates depending on more cases.
  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  /// This won't pop routes so you could do something like
  /// Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  /// after you called this method if you want to pop all routes.
  Future<void> logout() async {
    return await _firebaseAuth.signOut();
  }

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<dynamic> login(
      {@required String email, @required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<dynamic> signUp({@required UserModel newUser}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: newUser.email, password: newUser.password);
      return true;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<dynamic> signUpProfile({@required UserModel newUser}) async {
    return await _db
        .collection('users')
        .add({
          'name': newUser.name,
          'lastname': newUser.lastname,
          'dniType': newUser.dniType,
          'dniNumber': newUser.dniNumber,
          'telType': newUser.telType,
          'telNumber': newUser.telNumber,
        })
        .then((value) => "User Added")
        .catchError((error) => "Failed to add user: $error");
  }
}
