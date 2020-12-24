import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const Settings({key: Key, this.snapshot}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
