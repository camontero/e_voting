import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ElectionOption extends StatelessWidget {
  final String label;
  final String year;
  final String type;

  ElectionOption(
      {@required this.label,@required this.year, @required this.type});

  @override
  Widget build(BuildContext context) {

    final actionButton = Container(
        child: Icon(
          Icons.arrow_forward_ios,
          size: 14,
        ),
      );

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/election', arguments: {'year': year, 'type': type}),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                color: Colors.grey.withOpacity(0.1),
              )),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [Text(label)],
            ),
            actionButton
          ],
        ),
      ),
    );
  }
}
