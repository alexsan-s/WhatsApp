import 'package:WhatsApp/model/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingChats extends StatefulWidget {
  final AsyncSnapshot snapshot;

  const SettingChats({this.snapshot});
  @override
  _SettingChatsState createState() => _SettingChatsState();
}

class _SettingChatsState extends State<SettingChats> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.snapshot.data ? lightGreen : darkGreen,
        title: Text('Chats',
            style:
                TextStyle(color: widget.snapshot.data ? lightFontEnabled : darkFont, fontSize: 24)),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Display"),
            Row(
              children: [
                Expanded(
                    child: Icon(Icons.brightness_6,
                        color: widget.snapshot.data ? lightGreen : darkGreen, size: 28)),
                Expanded(
                    child: Text(
                  "Theme",
                  style: TextStyle(
                      color: widget.snapshot.data ? lightFontDefault : darkFont,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      changeTheme();
                      setState(() {});
                    },
                    child: Icon(widget.snapshot.data ? Icons.toggle_off_outlined : Icons.toggle_on,
                        size: 28),
                  ),
                  flex: 5,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  changeTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLight', false);
  }
}
