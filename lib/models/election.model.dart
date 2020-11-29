import 'package:flutter/foundation.dart';

class ElectionModel{
  String name;
  String type;
  String year;
  List<dynamic> positionElections;

  ElectionModel({
    @required this.name,
    @required this.type,
    @required this.year,
    @required this.positionElections,
  });

}