import 'package:WhatsApp/model/colors.dart';
import 'package:WhatsApp/view/settings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

setting() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('isLight')) {
    return prefs.getBool('isLight');
  } else {
    return true;
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: setting(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return buildSplash();
        } else {
          return Scaffold(
            appBar: buildAppBar(snapshot),
            body: Container(
              height: double.infinity,
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
                        buildExpandedText(snapshot, "CHARTS", true),
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
            itemBuilder: (BuildContext context) {
              return list.map((String list) {
                return PopupMenuItem(
                    child: InkWell(
                  onTap: () => Navigator.pushNamed(context, '/settings',
                      arguments: Settings(
                        snapshot: snapshot,
                      )),
                  child: Text(
                    list,
                    style: TextStyle(color: snapshot.data ? Colors.black : lightFontEnabled),
                  ),
                ));
              }).toList();
            },
            color: snapshot.data ? lightBackground : darkBackground)
      ],
      elevation: 0,
    );
  }

  Scaffold buildSplash() {
    return Scaffold(
        backgroundColor: colorSplash,
        body: Column(children: [
          Flexible(
              flex: 10,
              child: Center(
                  child: Image(
                image: AssetImage('assets/logo.png'),
                height: 70,
              ))),
          Text('from', style: TextStyle(color: Color.fromRGBO(78, 81, 86, 1), fontSize: 20)),
          Text('Alexsander da Silva',
              style: TextStyle(color: Color.fromRGBO(205, 208, 215, 1), fontSize: 22)),
          Spacer(
            flex: 1,
          )
        ]));
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
