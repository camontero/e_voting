import 'package:carousel_slider/carousel_slider.dart';
import 'package:svec/components/candidateCard.component.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final titleBox = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
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

    final candidatesCarousel = Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 570.0,
          enlargeCenterPage: true,
        ),
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return CandidateCard(
                name: "Gustavo Petro $i ",
                politicalParty: "Colombia Humana",
                city: "Bogotá D.C",
                amountOfVotes: "2500",
                thumbnail: "lib/assets/images/thumb-petro.jpg",
                proposals:
                    "\u2022 Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\u2022 Sed ultrices velit a iaculis consectetur.\n\u2022 Cras aliquam libero eu quam sodales tincidunt.\n\u2022 Donec in libero rhoncus odio laoreet varius.\n\u2022 Cras a nibh porta, accumsan leo at, condimentum ante.\n\u2022 Quisque eget erat nec eros ullamcorper placerat.\n\u2022 Nunc et turpis eget ante posuere placerat.\n\u2022 Nullam at orci nec libero tempus mattis.\n\u2022 Aliquam sed sem sit amet ipsum lacinia accumsan.\n\u2022 Praesent sollicitudin nisl sit amet metus dictum mollis nec quis nisi.\n\u2022 Etiam vitae orci dignissim, commodo leo sit amet, dignissim urna.\n\u2022 Quisque egestas velit sit amet pellentesque blandit.\n\u2022 Aenean id urna non dolor faucibus feugiat et nec est.\n\u2022 Maecenas varius metus ut nisl ullamcorper pretium.\n\u2022 Vestibulum varius magna at orci aliquet, at maximus nisi moles\n",
              );
            },
          );
        }).toList(),
      ),
    );
    final viewStructure = ListView(
      children: [
        titleBox,
        candidatesCarousel,
        // Text("Titulo"),
        // candidatesCarousel
      ],
    );

    return viewStructure;
  }

  @override
  bool get wantKeepAlive => true;
}
