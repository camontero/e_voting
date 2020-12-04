import 'package:charts_flutter/flutter.dart' as charts;
import 'package:svec/models/votesSeries.model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class VotesSeriesBar extends StatelessWidget {
  final List<VotesSeriesModel> data;

  VotesSeriesBar({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<VotesSeriesModel, String>> series = [
      charts.Series(
          id: "Votos en tiempo real",
          data: data,
          domainFn: (VotesSeriesModel series, _) => series.postulate,
          measureFn: (VotesSeriesModel series, _) => series.voters,
          colorFn: (VotesSeriesModel series, _) => series.barColor)
    ];
    return charts.BarChart(series,
        animate: true,
        domainAxis: new charts.OrdinalAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(labelRotation: 75),
          viewport: new charts.OrdinalViewport('AePS', 4),
        ));
  }
}
