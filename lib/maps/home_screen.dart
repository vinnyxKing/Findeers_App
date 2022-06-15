//
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:layout/body.dart';
//import 'package:flutter_scan_bluetooth/flutter_scan_bluetooth.dart';
import 'package:layout/connect.dart';

import 'devices.dart';

class HomeScreen extends StatelessWidget {
  List<DisplayDevices> device = [];
  HomeScreen(this.device, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
      ),
      body: Body(device),
    );
  }

  AppBar newMethod() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          "svg/back-arrow.svg",
          color: ktextcolor,
        ),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
            icon: SvgPicture.asset(
              "svg/search-line.svg",
              color: ktextcolor,
            ),
            onPressed: () {}),
        SizedBox(width: kdefaultpaddin / 2)
      ],
    );
  }
}
