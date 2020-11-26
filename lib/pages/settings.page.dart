import 'package:svec/components/settingOption.component.dart';
import 'package:flutter/material.dart';
import 'package:svec/services/auth.service.dart';
import 'package:provider/provider.dart';


class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final thumbnailBox = Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
          color: Colors.redAccent, borderRadius: BorderRadius.circular(100)),
      child: Text(
        'JJ',
        style: TextStyle(fontSize: 18,color: Colors.white),
      ),
    );

    final profileInfoBox = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Pepito Perez"),
          Text("+57 123 456 78 90"),
          Text("10010654798"),
        ],
      ),
    );

    final profileOptionBox = Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.1)))),
      child: GestureDetector(
        onTap: () => context.read<AuthService>().logout(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [thumbnailBox, profileInfoBox],
            ),
            Container(
              child: Icon(
                Icons.arrow_forward_ios,
                size: 14,
              ),
            )
          ],
        ),
      ),
    );

    final viewStructure = Container(
      padding: EdgeInsets.only(top: 60.0, left: 15.0, right: 15.0),
      // height: 400,
      child: ListView(
        children: [
          profileOptionBox,
          SettingOption(
            label: "Tu perfil",
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
              size: 16,
            ),
            colorBgIcon: Colors.pink,
            hasSwapAction: false,
          ),
          SettingOption(
            label: "Tus certificados",
            icon: Icon(
              Icons.bookmark,
              color: Colors.white,
              size: 16,
            ),
            colorBgIcon: Colors.amber,
            hasSwapAction: false,
          ),
          SettingOption(
            label: "Punto de votación",
            icon: Icon(
              Icons.home,
              color: Colors.white,
              size: 16,
            ),
            colorBgIcon: Colors.purple,
            hasSwapAction: false,
          ),
          SettingOption(
            label: "Ganador",
            icon: Icon(
              Icons.star,
              color: Colors.white,
              size: 16,
            ),
            colorBgIcon: Colors.deepOrangeAccent,
            hasSwapAction: true,
          ),
          SettingOption(
            label: "Notificaciones",
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
              size: 16,
            ),
            colorBgIcon: Colors.green,
            hasSwapAction: true,
          ),
        ],
      ),
    );
    return viewStructure;
  }

  @override
  bool get wantKeepAlive => true;
}
