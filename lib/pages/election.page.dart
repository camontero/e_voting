import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:svec/components/positionElection.component.dart';
import 'package:svec/components/yearOption.component.dart';
import 'package:svec/services/positionElections.service.dart';

class ElectionPage extends StatefulWidget {
  static const routeName = '/election';

  final Map<String, String> positionElections;

  ElectionPage(this.positionElections);

  @override
  _ElectionPageState createState() => _ElectionPageState();
}

class _ElectionPageState extends State<ElectionPage> {
  @override
  Widget build(BuildContext context) {
    final db = context.watch<FirebaseFirestore>();

    Future positionElections = PositionElectionsService(db)
        .getPositionElectionByTypeAndYear(
            type: this.widget.positionElections["type"],
            year: this.widget.positionElections["year"]);

    final titleBox = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(16)),
          child: Text(
            "Tu eliges",
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
    //


    final viewStructure = Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleBox,
          Container(
            margin: EdgeInsets.only(top: 30.0),
            height: (MediaQuery.of(context).size.height - 153),
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: FutureBuilder(
                  future: positionElections,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return Container(
                          child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {

                                return PositionElection(title: snapshot.data[index].name,candidates: snapshot.data[index].candidates);

                              }));
                    }
                  }),
            ),
          )
        ],
      ),
    );

    return viewStructure;
  }
}
