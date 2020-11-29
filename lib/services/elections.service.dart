import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:svec/models/election.model.dart';


class ElectionsService {
  final FirebaseFirestore _db;

  ElectionsService(this._db);

  Future<List<ElectionModel>> getElections() async {
    return await _db.collection('elections').get().then(
        (QuerySnapshot querySnapshot) => querySnapshot.docs
            .map((doc) => ElectionModel(
                name: doc["name"],
                type: doc["type"],
                year: doc["year"],
                positionElections: doc["positionElections"]))
            .toList());
  }


  // Future<List<ElectionModel>> getElectionByType({@required type}) async {
  //   return await _db.collection('elections')
  //       .where('type', isEqualTo: type)
  //       .get()
  //       .then(
  //       (QuerySnapshot querySnapshot) => querySnapshot.docs
  //           .map((doc) => ElectionModel(
  //               name: doc["name"],
  //               type: doc["type"],
  //               year: doc["year"],
  //               positionElections: doc["positionElections"]))
  //           .toList());
  // }
}
