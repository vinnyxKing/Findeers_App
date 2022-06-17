import 'dart:math';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';

import 'mapUtility.dart';

class mapsspace {
  final String val_rssi;

  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<ScanResult> scanResultList = [];
  bool _isScanning = false;
  bool found = false;
  int rssi_val = 0;
  var dev_name;
  int measured_Dis = -69;
  double dis = 0;
  int distance = 0;
  double latt = 0;
  double longg = 0;
  double latt2 = 0;
  double longg2 = 0;

  mapsspace(this.val_rssi);

  void cal() {
    rssi_val = int.parse(val_rssi);
    print("distance is :");
    dis = pow(10, (((measured_Dis - (rssi_val)) / (10 * 2)))) as double;

    distance = dis.ceil();
    print(distance);
  }

  double lat(double latitude) {
    double new_latitude;
    var earth = 6378137, //radius of the earth in kilometer
        m = (1 / ((2 * pi / 360) * earth)) / 1000; //1 meter in degree

    new_latitude = latitude + (distance * m);
    return new_latitude;
  }

  double long(double longitude) {
    // double longitude;
    var earth = 6378137, //radius of the earth in kilometer
        m = (1 / ((2 * pi / 360) * earth)) / 1000; //1 meter in degree

    double new_longitude =
        longitude + (distance * m) / cos(longitude * (pi / 180));
    return new_longitude;
  }

  void currentlocation() async {
    Position position = await _determinePosition();
    latt2 = position.latitude;
    longg2 = position.longitude;
    cal();

    latt = lat(position.latitude);
    longg = long(position.longitude);

    MapUtils.shoemaps(latt, longg);
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}
