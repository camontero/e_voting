import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:svec/components/positionElection.component.dart';
import 'package:svec/models/election.model.dart';
import 'package:svec/models/positionElection.model.dart';
import 'package:svec/services/positionElections.service.dart';

class ElectionPage extends StatefulWidget {
  static const routeName = '/election';
  final ElectionModel election;

  ElectionPage(this.election);

  @override
  _ElectionPageState createState() => _ElectionPageState();
}

class _ElectionPageState extends State<ElectionPage> {
  Future<List<PositionElectionModel>> _positionElections;

  @override
  void didChangeDependencies() {
    final db = context.read<FirebaseFirestore>();
    _positionElections = PositionElectionsService(db)
        .getPositionElectionByTypeAndYear(
            type: this.widget.election.type, year: this.widget.election.year);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final titleBox = Row(
      mainAxisSize: MainAxisSize.max,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 80.0, left: 20.0, right: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Theme.of(context).primaryColor,
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 28,
            ),
            tooltip: 'Increase volume by 10',
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 80.0),
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(16.0)),
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
            height: (MediaQuery.of(context).size.height - 173),
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: FutureBuilder(
                  future: _positionElections,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return Container(
                          child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return PositionElection(
                                    title: snapshot.data[index].name,
                                    docId: snapshot.data[index].id);
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
