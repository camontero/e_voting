import 'package:svec/components/votesSeriesBar.component.dart';
import 'package:svec/models/votesSeries.model.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final List<VotesSeries> data = [
      VotesSeries(
        postulate: "Petro 1",
        voters: 20000,
        barColor:
            charts.ColorUtil.fromDartColor(Theme.of(context).primaryColor),
      ),
      VotesSeries(
        postulate: "Petro 2",
        voters: 25000,
        barColor:
            charts.ColorUtil.fromDartColor(Theme.of(context).primaryColorDark),
      ),
      VotesSeries(
        postulate: "Petro 3",
        voters: 30000,
        barColor:
            charts.ColorUtil.fromDartColor(Theme.of(context).primaryColorLight),
      ),
    ];

    final titleBox = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(16)),
          child: Text(
            "Estadísticas",
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );

    final seriesBarBox = Container(
      height: 350,
      width: 305.0,
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.only(bottom:15.0, left: 15.0, right: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(173, 179, 191, 1.0),
              blurRadius: 10.0,
              offset: Offset(5.0, 5.0))
        ],
      ),
      child: VotesSeriesBar(data: data),
    );

    final viewStructure = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        titleBox,
        Container(
          margin: EdgeInsets.only(top: 30.0),
          height: (MediaQuery.of(context).size.height - 210),
          width: 325.0,
          child: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView(
              children: [
                seriesBarBox,
                seriesBarBox,
              ],
            ),
          ),
        )
      ],
    );

    return viewStructure;
  }

  @override
  bool get wantKeepAlive => true;
}
