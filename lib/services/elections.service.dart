import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:svec/models/election.model.dart';

class ElectionsService {
  final FirebaseFirestore _db;

  ElectionsService(this._db);

  Future<List<ElectionModel>> getElections() async {
    print("a");
    return await _db
        .collection('elections')
        .orderBy('year', descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) => querySnapshot.docs
            .map((doc) => ElectionModel(
                id: doc.id,
                isActive: doc["isActive"],
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
