import 'package:charts_flutter/flutter.dart' as charts;
import 'package:svec/models/votesSeries.model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class  VotesSeriesBar extends StatelessWidget {

  final List<VotesSeries> data;

  VotesSeriesBar({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<VotesSeries, String>> series = [
      charts.Series(
        id: "Votos en tiempo real",
        data: data,
        domainFn: (VotesSeries series, _) =>
            series.postulate,
        measureFn: (VotesSeries series, _) =>
            series.voters,
        colorFn: (VotesSeries series, _) =>
            series.barColor
      )
    ];
    return charts.BarChart(series, animate: true);
  }
}
