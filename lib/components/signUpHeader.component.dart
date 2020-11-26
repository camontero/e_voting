import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

// ignore: must_be_immutable
class SignUpHeader extends StatelessWidget {
  String title;
  String subtitle;
  String image;
  final icon;

  SignUpHeader(
      {@required this.title,
      this.subtitle = "",
      this.image = "",
      this.icon,});

  @override
  Widget build(BuildContext context) {
    final decorationRectangle = Container(
      width: 45.0,
      height: 45.0,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
    );

    final titleBox = Container(
      margin: EdgeInsets.only(
        top: 25.0,
      ),
      child: Text(
        this.title,
        style: TextStyle(color: Colors.black, fontSize: 42),
      ),
    );

    var subtitleBox;
    if (this.subtitle != "") {
      subtitleBox = Container(
        margin: EdgeInsets.only(top: 15.0),
        child: Text(
          this.subtitle,
          style: TextStyle(color: Colors.grey, fontSize: 24),
        ),
      );
    }

    var imageBox;
    if (this.image != "") {
      imageBox = Container(
        child: Image(image: AssetImage(this.image)),
      );
    }

    var iconBox;
    if (this.icon != null) {
      iconBox = Container(
        child: Icon(
          this.icon,
          size: 80,
        ),
      );
    }

    final viewStructure = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        decorationRectangle,
        titleBox,
        if (this.image != "") imageBox,
        if (this.icon != null) iconBox,
        if (this.subtitle != "") subtitleBox,
      ],
    );

    return viewStructure;
  }
}
