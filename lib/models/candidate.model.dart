import 'package:flutter/foundation.dart';

class CandidateModel {
  String name;
  String lastname;
  String politicalParty;
  String city;
  String thumbnail;

  CandidateModel(
      {@required this.name,
      @required this.lastname,
      @required this.politicalParty,
      @required this.city,
      @required this.thumbnail});
}
