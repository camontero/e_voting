import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:svec/models/proposal.model.dart';

class ProposalsService {
  final FirebaseFirestore _db;

  ProposalsService(this._db);

  Future<List<ProposalModel>> getProposoalByCandidateId({@required id}) async {
    DocumentReference candidateRef = _db.collection('candidates').doc(id);
    return await _db
        .collection('proposals')
        .where('idCandidate', isEqualTo: candidateRef)
        .get()
        .then((QuerySnapshot querySnapshot) => querySnapshot.docs
            .map((doc) => ProposalModel(
                id: doc.id,
                idCandidate: doc["idCandidate"],
                proposals: doc["proposals"],
                charge: doc["charge"],
                year: doc["year"]))
            .toList());
  }
}
