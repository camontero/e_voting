import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:svec/models/candidate.model.dart';
import 'package:svec/models/positionElection.model.dart';

class PositionElectionsService {
  final FirebaseFirestore _db;

  PositionElectionsService(this._db);

  Future<List<PositionElectionModel>> getPositionElectionByTypeAndYear(
      {@required type, @required year}) async {
    return await _db
        .collection('positionElections')
        .where('type', isEqualTo: type)
        .where('year', isEqualTo: year)
        .get()
        .then((QuerySnapshot querySnapshot) =>
        querySnapshot.docs
            .map((doc) =>
            PositionElectionModel(
                id: doc.id,
                name: doc["name"],
                type: doc["type"],
                year: doc["year"],
                positionElection: doc["positionElection"],
                candidates: doc["candidates"]))
            .toList());
  }


  Future<List<CandidateModel>> getCandidatesByReferences({@required id}) async {

    DocumentSnapshot placedOrdersIdSnapshot = await _db
        .collection("positionElections")
        .doc(id)
        .get();
    List<DocumentReference> candidatesRefs = [
      ...placedOrdersIdSnapshot.data()["candidates"]
    ];

    List<CandidateModel> candidates = await Future.wait<CandidateModel>(candidatesRefs.map((element) {
      return element.get().then((doc) => CandidateModel(
      id: doc.id,
      name: doc["name"],
      lastname: doc["lastname"],
      politicalParty: doc["politicalParty"],
      city: doc["city"],
      thumbnailName: doc["thumbnailName"]));
    }));


    return  candidates;
  }


}
