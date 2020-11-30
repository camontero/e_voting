import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'candidateCard.component.dart';

class PositionElection extends StatelessWidget {
  String title;
  final candidates;

  PositionElection({@required this.title, @required this.candidates});

  @override
  Widget build(BuildContext context) {
    final db = context.watch<FirebaseFirestore>();

    Future<List> jacobo() async{


      return await candidates.forEach((value){
        return value.get();
      });

    }




    // print(candidates.runtimeType);

    final titleBox = Container(
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        "$title",
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    final candidatesCarousel = Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 500.0,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
        ),
        items:List<int>.generate(candidates.length, (i) => (i-1) + 1).map((index) {
          // print( );
          return FutureBuilder(
                  future: candidates[index].get(),
                  builder: (context, AsyncSnapshot snapshot) {

                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return CandidateCard(
                        candidateId: snapshot.data.id,
                      );
                    }
                  });
        }).toList(),
      ),
    );
    //
    //
    //
    final viewStructure = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [titleBox, candidatesCarousel],
      ),
    );
    return viewStructure;
  }
}
