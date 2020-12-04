import 'package:flutter/foundation.dart';

class ElectionModel{
  String id;
  String name;
  bool isActive;
  String type;
  String year;
  List<dynamic> positionElections;

  ElectionModel({
    @required this.id,
    @required this.isActive,
    @required this.name,
    @required this.type,
    @required this.year,
    @required this.positionElections,
  });

}