//product
import 'package:flutter/material.dart';
//import 'package:flutter_scan_bluetooth/flutter_scan_bluetooth.dart';

class DisplayDe extends StatelessWidget {
  //List<DisplayDevices> device = [];
  // List<DisplayDevices> stored_device = [];

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DisplayDevices {
  final String val_rssi, name, address;

  DisplayDevices({
    required this.val_rssi,
    required this.name,
    required this.address,
  });
}
