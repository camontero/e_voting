import 'package:flutter/foundation.dart';

class CandidateModel {
  String id;
  String name;
  String lastname;
  String politicalParty;
  String city;
  String thumbnailName;

  CandidateModel(
      {@required this.id,
      @required this.name,
      @required this.lastname,
      @required this.politicalParty,
      @required this.city,
      @required this.thumbnailName});
}
