import 'package:flutter/foundation.dart';

class PositionElectionModel {
  String name;
  String type;
  String year;
  String positionElection;
  List<dynamic> candidates;

  PositionElectionModel(
      {@required this.name,
      @required this.type,
      @required this.year,
      @required this.positionElection,
      @required this.candidates});
}
