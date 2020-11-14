import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

// ignore: must_be_immutable
class SettingOption extends StatefulWidget {
  String label;
  Icon icon;
  Color colorBgIcon;
  bool hasSwapAction;

  SettingOption(
      {@required this.label,
      @required this.icon,
      this.colorBgIcon,
      this.hasSwapAction});

  @override
  _SettingOptionState createState() => _SettingOptionState();
}

class _SettingOptionState extends State<SettingOption> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    final iconBox = Container(
      margin: EdgeInsets.only(right: 15.0),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: this.widget.colorBgIcon,
      ),
      child: this.widget.icon,
    );

    var actionButton;
    if (this.widget.hasSwapAction) {
      actionButton = Container(
        child: CupertinoSwitch(
          value: this._isSwitched,
          onChanged: (value) {
            setState(() {
              this._isSwitched = value;
              // print(this._isSwitched);
            });
          },
          // activeTrackColor: Colors.lightGreenAccent,
          activeColor: Theme.of(context).primaryColor,
        ),
      );
    } else {
      actionButton = Container(
        child: Icon(
          Icons.arrow_forward_ios,
          size: 14,
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
              color: Colors.grey.withOpacity(0.1),
            )),
      ),
      child: GestureDetector(
        onTap: () => this.widget.hasSwapAction ? null : print("jac"),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [iconBox, Text(this.widget.label)],
            ),
            actionButton
          ],
        ),
      ),
    );
  }
}
