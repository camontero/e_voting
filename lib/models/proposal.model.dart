import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ProposalModel{
  String id;
  DocumentReference idCandidate;
  String proposals;
  String charge;
  String year;


  ProposalModel({
    @required this.id,
    @required this.idCandidate,
    @required this.proposals,
    @required this.charge,
    @required this.year,
  });

}