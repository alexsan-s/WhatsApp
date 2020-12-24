import 'package:WhatsApp/controller/setting.dart';
import 'package:WhatsApp/model/build.dart';
import 'package:WhatsApp/model/colors.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  final bool snapshot;
  const Settings({this.snapshot});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: widget.snapshot ? lightGreen : darkGreen,
      title: Text('Settings',
          style: TextStyle(color: widget.snapshot ? lightFontEnabled : darkFont, fontSize: 24)),
    );
  }

  Row buildSettingsOptions(IconData icon, String title, String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Icon(icon, color: widget.snapshot ? lightGreen : darkGreen)),
        Expanded(
          flex: 5,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              title,
              style: TextStyle(
                  color: widget.snapshot ? Colors.black : darkFont,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              subtitle,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: widget.snapshot ? lightFontDefault : darkFont,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )
          ]),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return FutureBuilder(
        future: setting(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return buildSplash();
          } else {
            return Scaffold(
              appBar: buildAppBar(),
              body: Container(
                width: size.width,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Icon(Icons.person, size: 28)),
                        Expanded(
                          flex: 3,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text(
                              "Alexsander da Silva",
                              style: TextStyle(
                                  color: widget.snapshot ? Colors.black : darkFont,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Disponível",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: widget.snapshot ? lightFontDefault : darkFont,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ]),
                        ),
                        Expanded(
                            child: Icon(
                          Icons.qr_code,
                          color: widget.snapshot ? lightGreen : darkGreen,
                        ))
                      ],
                    ),
                    Divider(),
                    InkWell(
                      child: buildSettingsOptions(Icons.message, "Chats", "Theme"),
                      onTap: () =>
                          Navigator.pushNamed(context, '/settingChats', arguments: widget.snapshot),
                    ),
                    Divider(),
                  ],
                ),
              ),
            );
          }
        });
  }
}
