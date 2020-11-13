import 'package:flutter/material.dart';

class StatisticsPage extends StatefulWidget{
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage>  with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(child: Text("estadisticas crack"),);
  }

  @override
  bool get wantKeepAlive => true;
}
