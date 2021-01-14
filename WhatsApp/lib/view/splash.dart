import '../model/colors.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSplash,
      body: Column(
        children: [
          Flexible(
              flex: 10,
              child: Center(
                  child: Image(
                image: AssetImage('assets/logo.png'),
                height: 70,
              ))),
          Text(
            'from',
            style: TextStyle(
              color: Color.fromRGBO(78, 81, 86, 1),
              fontSize: 20,
            ),
          ),
          Text(
            'Alexsander da Silva',
            style: TextStyle(
              color: Color.fromRGBO(205, 208, 215, 1),
              fontSize: 22,
            ),
          ),
          Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }
}
