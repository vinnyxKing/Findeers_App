//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:layout/connect.dart';
import 'package:layout/devices.dart';
//import 'package:flutter_scan_bluetooth/flutter_scan_bluetooth.dart';
import 'package:layout/sectionss.dart';
import 'package:layout/blueT.dart';
import 'devicedisplay.dart';
import 'info.dart';
import 'devices.dart';

class Body extends StatelessWidget {
  //const Body({Key? key}) : super(key: key);
  List<DisplayDevices> devic = [];
  Body(this.devic);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kdefaultpaddin),
          child: Text(
            "FindersApp",
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        sections(),
        //  storeddevices(),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kdefaultpaddin),
          child: GridView.builder(
            itemCount: devic.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: kdefaultpaddin,
              crossAxisSpacing: kdefaultpaddin,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) => storeddevices(
                devices: devic[index],
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeviceInfo(
                              devices: devic[index],
                            )))),
          ),
          
        ))
      ],
      
    ),
    floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ScanBlue()));
        },
        child: Icon(Icons.search),
      ),
    );
  }
}
