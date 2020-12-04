import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:svec/models/election.model.dart';

class ElectionOption extends StatelessWidget {
  final ElectionModel election;

  ElectionOption({@required this.election});

  @override
  Widget build(BuildContext context) {
    final actionButton = Container(
      child: Icon(
        Icons.arrow_forward_ios,
        size: 14,
        color: election.isActive ? null : Colors.grey.withOpacity(0.6),
      ),
    );

    return GestureDetector(
      onTap: () => election.isActive
          ? Navigator.of(context).pushNamed('/election', arguments: election)
          : null,
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
              children: [
                Text(
                  election.name,
                  style: TextStyle(
                    color: election.isActive
                        ? null
                        : Colors.grey.withOpacity(0.6),
                  ),
                )
              ],
            ),
            actionButton
          ],
        ),
      ),
    );
  }
}
