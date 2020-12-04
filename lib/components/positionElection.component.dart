import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:svec/components/candidateCard.component.dart';
import 'package:svec/models/candidate.model.dart';
import 'package:svec/services/positionElections.service.dart';


class PositionElection extends StatefulWidget {
  final String title;
  final docId;

  PositionElection({@required this.title, @required this.docId});

  @override
  _PositionElectionState createState() => _PositionElectionState();
}

class _PositionElectionState extends State<PositionElection> {
  Future<List<CandidateModel>> _candidates;

  @override
  void didChangeDependencies() {
    final db = context.read<FirebaseFirestore>();
    _candidates =
        PositionElectionsService(db).getCandidatesByReferences(id: widget.docId);
    //TODO: Make one query with all candidate info to prevent requerying every time a candidate is builded in the carusel
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {


    final titleBox = Container(
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        "${widget.title}",
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    final candidatesCarousel = Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      child: FutureBuilder(
          future: _candidates,
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Container(
                  child: CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 500.0,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                      ),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        // print(index);
                        return  CandidateCard(candidate: snapshot.data[index]);
                      }));
            }
          }),
    );


    final viewStructure = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [titleBox, candidatesCarousel],
      ),
    );
    return viewStructure;
  }
}
