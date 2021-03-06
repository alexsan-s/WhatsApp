import 'package:WhatsApp/controller/setting.dart';
import 'package:WhatsApp/view/home.dart';
import 'package:WhatsApp/view/settings.dart';
import 'package:WhatsApp/view/settingsChats.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
        '/settings': (context) => Settings(),
        '/settingChats': (context) => SettingChats(),
      },
    );
  }
}
