import 'package:WhatsApp/controller/setting.dart';
import 'package:WhatsApp/model/colors.dart';
import 'package:WhatsApp/model/isLight.dart';
import 'package:WhatsApp/view/splash.dart';
import 'package:flutter/material.dart';

import 'buildAppBar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  IsLight isLight = IsLight();

  @override
  void dispose() {
    super.dispose();
    isLight.closeStream();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: setting(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Splash();
          } else {
            bool dataBool = snapshot.data;
            return DefaultTabController(
              initialIndex: 1,
              length: 4,
              child: StreamBuilder(
                  initialData: dataBool,
                  stream: isLight.theme,
                  builder: (context, AsyncSnapshot<bool> snapshot) {
                    return Scaffold(
                      backgroundColor:
                          snapshot.data ? lightBackground : darkBackground,
                      appBar: BuildAppBar(
                        objIsLight: snapshot.data,
                      ),
                      body: TabBarView(
                        children: [
                          Container(),
                          Container(
                            child: Column(
                              children: [
                                Text(
                                  '${snapshot.data.toString()}',
                                ),
                                RaisedButton(onPressed: () => isLight.change()),
                              ],
                            ),
                          ),
                          Container(),
                          Container(),
                        ],
                      ),
                    );
                  }),
            );
          }
        });
  }
}
