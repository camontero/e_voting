import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:svec/models/candidate.model.dart';

class CandidatesService {
  final FirebaseFirestore _db;

  CandidatesService(this._db);

  Future<List<CandidateModel>> getCandidatesByChargeAndYear({@required charge, @required year}) async {
    return await _db.collection('candidates')
        .where('charge', isEqualTo: charge)
        .where('year', isEqualTo: year)
        .get()
        .then(
        (QuerySnapshot querySnapshot) => querySnapshot.docs
            .map((doc) => CandidateModel(
                name: doc["name"],
                lastname: doc["lastname"],
                politicalParty: doc["politicalParty"],
                city: doc["city"],
                thumbnail: doc["thumbnail"],
        )).toList());
  }

}
