import 'package:shared_preferences/shared_preferences.dart';

setting() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('isLight')) {
    return prefs.getBool('isLight');
  } else {
    return true;
  }
}
