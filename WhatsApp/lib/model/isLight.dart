import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class IsLight {
  bool _isLight = true;

  bool get isLight => _isLight;

  final _blocController = StreamController<bool>.broadcast();

  Stream<bool> get theme => _blocController.stream;

  void change() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLight = !isLight;
    prefs.setBool('isLight', _isLight);
    _blocController.sink.add(isLight);
  }

  closeStream() {
    _blocController.close();
  }
}
