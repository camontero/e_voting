import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

// ignore: must_be_immutable
class CandidateCard extends StatefulWidget {
  String name;
  String politicalParty;
  String city;
  String amountOfVotes;
  String thumbnail;
  String proposals;


  CandidateCard(
      {this.name,
      this.politicalParty,
      this.city,
      this.amountOfVotes,
      this.thumbnail,
      this.proposals});



  @override
  _CandidateCardState createState() => _CandidateCardState();
}

class _CandidateCardState extends State<CandidateCard> {

  bool _cardDisabled = false;
  GlobalKey<FlipCardState> _cardKey = GlobalKey<FlipCardState>();

  void _showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancelar"),
      onPressed: () => Navigator.of(context).pop(),
    );
    Widget continueButton = FlatButton(
      child: Text("Votar"),
      onPressed: () {
        Navigator.of(context).pop();
        setState(() { this._cardDisabled = true; });
      }
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Usted está a punto de votar por ${this.widget.name}"),
      content: Text("¿Está seguro de votar por ${this.widget.name}?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    final placeBox = Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Icon(
              Icons.place,
              size: 16,
              color: Colors.white,
            ),
          ),
          Text(
            this.widget.city,
            style: TextStyle(
              color: Colors.white,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 5.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),
          )
        ],
      ),
    );

    final votesBox = Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Icon(
              Icons.how_to_vote,
              size: 16,
              color: Colors.white,
            ),
          ),
          Text(
            this.widget.amountOfVotes,
            style: TextStyle(
              color: Colors.white,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 5.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),
          )
        ],
      ),
    );

    final headerFrontBox = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [placeBox, votesBox],
      ),
    );

    final nameBox = Container(
      child: Text(
        this.widget.name,
        style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(3.0, 3.0),
                blurRadius: 5.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ]),
      ),
    );

    final politicalPartyBox = Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Text(
        this.widget.politicalParty,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: <Shadow>[
            Shadow(
              offset: Offset(3.0, 3.0),
              blurRadius: 5.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ],
        ),
      ),
    );

    final swapButton = Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Theme.of(context).primaryColor),
      child: IconButton(
        icon: Icon(
          Icons.swap_horiz,
          color: Colors.white,
        ),
        tooltip: 'Increase volume by 10',
        onPressed: () => this._cardKey.currentState.toggleCard(),
      ),
    );

    final footerFrontBox = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          nameBox,
          politicalPartyBox,
        ],
      ),
    );

    final frontCard = GestureDetector(
      onDoubleTap: () => this._cardDisabled ? null: this._showAlertDialog(context),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 25.0,
              left: 25.0,
              right: 25.0,
              bottom: 45.0,
            ),

            foregroundDecoration: BoxDecoration(
              color: this._cardDisabled ? Colors.grey: null,
              backgroundBlendMode: this._cardDisabled ? BlendMode.saturation: null,
              borderRadius: this._cardDisabled ? BorderRadius.circular(25): null,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: AssetImage(this.widget.thumbnail),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(173, 179, 191, 1.0),
                    blurRadius: 10.0,
                    offset: Offset(5.0, 5.0))
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [headerFrontBox, footerFrontBox],
            ),
          ),
          Positioned(bottom: 20.0, right: 25.0, child: swapButton)
        ],
      ),
    );

    final titleBackBox = Container(
      margin: EdgeInsets.only(bottom: 15.0),
      child: Text(
        "Propuestas",
        style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor),
      ),
    );

    final proposalsBackBox = Container(
        child: Text(
      this.widget.proposals,
      // style: Te,
    ));

    final backCard = Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 25.0,
            left: 25.0,
            right: 25.0,
            bottom: 45.0,
          ),
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
          child: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView(
              children: [titleBackBox, proposalsBackBox],
            ),
          ),
        ),
        Positioned(bottom: 20.0, right: 25.0, child: swapButton)
      ],
    );

    final viewStructure = Container(
        width: 305.0,
        height: 540.0,
        margin: EdgeInsets.symmetric(vertical: 15.0),
        decoration: BoxDecoration(),
        child: FlipCard(
            key: this._cardKey,
            flipOnTouch: false,
            front: frontCard,
            back: backCard));
    return viewStructure;
  }
}
