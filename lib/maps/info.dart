import 'package:flutter/material.dart';
//import 'package:flutter_scan_bluetooth/flutter_scan_bluetooth.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../devices/connect.dart';
import '../devices/device_info.dart';
import '../devices/devices.dart';

class DeviceInfo extends StatelessWidget {
  final DisplayDevices devices;

  const DeviceInfo({Key? key, required this.devices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: Body_detail(devices: devices),
    );
  }
}
