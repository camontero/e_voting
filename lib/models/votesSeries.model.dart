import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class VotesSeriesModel {

  final String postulate;
  final int voters;
  final charts.Color barColor;

  VotesSeriesModel({
    @required this.postulate,
    @required this.voters,
    @required this.barColor
  });

}