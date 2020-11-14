import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class VotesSeries {

  final String postulate;
  final int voters;
  final charts.Color barColor;

  VotesSeries({
    @required this.postulate,
    @required this.voters,
    @required this.barColor
  });

}