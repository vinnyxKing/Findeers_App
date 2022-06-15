import 'package:flutter/material.dart';
//import 'package:flutter_scan_bluetooth/flutter_scan_bluetooth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:layout/connect.dart';
import 'package:layout/device_info.dart';

import 'devices.dart';

class DeviceInfo extends StatelessWidget {
  final DisplayDevices devices;

  const DeviceInfo({Key? key, required this.devices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: buildAppBar(context),
      body: Body_detail(devices: devices),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black12,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'svg/back-arrow.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () {}, icon: SvgPicture.asset('svg/search-line.svg')),
        SizedBox(width: kdefaultpaddin / 2)
      ],
    );
  }
}
