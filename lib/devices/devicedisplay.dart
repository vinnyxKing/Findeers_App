import 'package:flutter/material.dart';
//import 'package:flutter_scan_bluetooth/flutter_scan_bluetooth.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:layout/connect.dart';
import 'package:layout/devices.dart';
import 'package:layout/sectionss.dart';

class storeddevices extends StatelessWidget {
  final DisplayDevices devices;

  final Function press;
  const storeddevices({
    Key? key,
    required this.devices,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => press()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kdefaultpaddin),
              //height: 180,
              //width: 160,
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(16)),
              child: Image.asset("images/image1.jpg"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kdefaultpaddin / 4),
            child: Text(
              devices.name,
              style: TextStyle(color: ktextlightcolor),
            ),
          ),
          Text(
            "\$Mac_Address ${devices.address}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}