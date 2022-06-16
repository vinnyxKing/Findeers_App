import 'package:findeers_app/utilities/app_colors.dart';
import 'package:flutter/material.dart';

import '../devices/blueT.dart';
import '../devices/devices.dart';
import '../maps/home_screen.dart';
import 'homescreen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<DisplayDevices> stored = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: HomeScreen(stored),
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
