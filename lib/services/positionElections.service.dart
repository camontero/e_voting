import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:svec/models/positionElection.model.dart';


class PositionElectionsService {
  final FirebaseFirestore _db;

  PositionElectionsService(this._db);

   Future<List<PositionElectionModel>> getPositionElectionByTypeAndYear({@required type, @required year}) async {
    return await _db.collection('positionElections')
        .where('type', isEqualTo: type)
        .where('year', isEqualTo: year)
        .get()
        .then(
        (QuerySnapshot querySnapshot) => querySnapshot.docs
            .map((doc) => PositionElectionModel(
                name: doc["name"],
                type: doc["type"],
                positionElection: doc["positionElection"],
                candidates: doc["candidates"]))
            .toList());
  }

}
