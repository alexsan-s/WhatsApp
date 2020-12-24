import 'package:WhatsApp/controller/setting.dart';
import 'package:WhatsApp/model/build.dart';
import 'package:WhatsApp/model/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            appBar: buildAppBar(snapshot),
            body: Container(
              height: size.height,
              color: snapshot.data ? lightBackground : darkBackground,
              child: Column(
                children: [
                  Container(
                    color: snapshot.data ? lightGreen : darkGreen,
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildExpandedIcon(snapshot),
                        buildExpandedText(snapshot, "CHATS", true),
                        buildExpandedText(snapshot, "STATUS", false),
                        buildExpandedText(snapshot, "CALLS", false),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }

  AppBar buildAppBar(AsyncSnapshot snapshot) {
    List<String> list = <String>['New group', 'Starred Messages', 'Settings'];
    return AppBar(
      backgroundColor: snapshot.data ? lightGreen : darkGreen,
      title: Text(
        "WhatsApp",
        style: TextStyle(color: snapshot.data ? lightFontEnabled : darkFont, fontSize: 24),
      ),
      actions: [
        Icon(
          Icons.search,
          color: snapshot.data ? lightFontEnabled : darkFont,
        ),
        PopupMenuButton(
            itemBuilder: (context) => [
                  PopupMenuItem(
                      child: InkWell(
                        child: Text("New Group",
                            style:
                                TextStyle(color: snapshot.data ? Colors.black : lightFontEnabled)),
                      ),
                      value: 1),
                  PopupMenuItem(
                      child: InkWell(
                        child: Text("Starred Messages",
                            style:
                                TextStyle(color: snapshot.data ? Colors.black : lightFontEnabled)),
                      ),
                      value: 2),
                  PopupMenuItem(
                      child: InkWell(
                        onTap: () {
                          print('oi');
                        },
                        child: Text("Settings",
                            style:
                                TextStyle(color: snapshot.data ? Colors.black : lightFontEnabled)),
                      ),
                      value: 3),
                ],
            color: snapshot.data ? lightGreen : darkGreen)
      ],
      elevation: 0,
    );
  }

  BoxDecoration buildBoxDecorationEnabled(AsyncSnapshot snapshot) {
    return BoxDecoration(
        border: Border(
            bottom:
                BorderSide(color: snapshot.data ? lightFontEnabled : darkFontEnabled, width: 3)));
  }

  BoxDecoration buildBoxDecorationDesabled(AsyncSnapshot snapshot) {
    return BoxDecoration(
        border:
            Border(bottom: BorderSide(color: snapshot.data ? lightGreen : darkGreen, width: 3)));
  }

  Expanded buildExpandedIcon(AsyncSnapshot snapshot) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 30,
        decoration: buildBoxDecorationDesabled(snapshot),
        child: Icon(
          Icons.camera_alt_rounded,
          color: snapshot.data ? lightFont : darkFont,
        ),
      ),
    );
  }

  Expanded buildExpandedText(AsyncSnapshot snapshot, String text, bool active) {
    return Expanded(
        flex: 2,
        child: Container(
          height: 30,
          decoration:
              active ? buildBoxDecorationEnabled(snapshot) : buildBoxDecorationDesabled(snapshot),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: snapshot.data
                    ? active
                        ? lightFontEnabled
                        : lightFont
                    : active
                        ? darkFontEnabled
                        : darkFont,
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}
