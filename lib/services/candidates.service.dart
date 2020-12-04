import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:svec/models/candidate.model.dart';

class CandidatesService {
  final FirebaseFirestore _db;

  CandidatesService(this._db);

  Future<CandidateModel> getCandidateById({@required String id}) async {
    return await _db
        .collection('candidates')
        .doc(id)
        .get()
        .then((DocumentSnapshot doc) => CandidateModel(
              id: doc.id,
              name: doc["name"],
              lastname: doc["lastname"],
              politicalParty: doc["politicalParty"],
              city: doc["city"],
              thumbnailName: doc["thumbnailName"],
            ));
  }
//  Future getCandidatesByIds({@required String id}) async {
//   return await _db.collection('candidates').doc(id)
//       .get()
//       .then((value) {return value;
//   } ).toList();
// }

}
