import 'package:flutter/foundation.dart';

class PositionElectionModel {
  String name;
  String type;
  String positionElection;
  List<dynamic> candidates;

  PositionElectionModel(
      {@required this.name,
      @required this.positionElection,
      @required this.type,
      @required this.candidates});
}
