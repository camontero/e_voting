import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:svec/components/ElectionOption.component.dart';
import 'package:flutter/material.dart';
import 'package:svec/models/election.model.dart';
import 'package:svec/services/elections.service.dart';

class ElectionsPage extends StatefulWidget {
  @override
  _ElectionsPageState createState() => _ElectionsPageState();
}

class _ElectionsPageState extends State<ElectionsPage>
    with AutomaticKeepAliveClientMixin {

  Future<List<ElectionModel>> _elections;

  @override
  void didChangeDependencies() {
    final db = context.read<FirebaseFirestore>();
    _elections =  ElectionsService(db).getElections();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {



    super.build(context);

    final titleBox = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(16)),
          child: Text(
            "Elecciones",
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );

    final viewStructure = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleBox,
        Container(
          margin: EdgeInsets.only(top: 30.0),
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          height: (MediaQuery.of(context).size.height - 210),
          child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: FutureBuilder(
                  future: _elections,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return Container(
                          child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ElectionOption(election: snapshot.data[index]);
                              }));
                    }
                  })),
        ),
      ],
    );

    //NOTE: Yep, let ListView because when the user log in, the last text field from the form overflowed the view. In order to prevent it, we use a ListView. Anyways eventually it will becomes a big list
    return ListView(children: [viewStructure]);
  }

  @override
  bool get wantKeepAlive => true;
}
