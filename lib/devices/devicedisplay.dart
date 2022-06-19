import 'package:flutter/material.dart';
//import 'package:flutter_scan_bluetooth/flutter_scan_bluetooth.dart';

import 'connect.dart';
import 'devices.dart';

class storeddevices extends StatefulWidget {
  final DisplayDevices devices;

  final Function press;
  const storeddevices({
    Key? key,
    required this.devices,
    required this.press,
  }) : super(key: key);

  @override
  State<storeddevices> createState() => _storeddevicesState();
}

class _storeddevicesState extends State<storeddevices> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => widget.press()),
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
              widget.devices.name,
              style: TextStyle(color: ktextlightcolor),
            ),
          ),
          Text(
            "\$Mac_Address ${widget.devices.address}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
