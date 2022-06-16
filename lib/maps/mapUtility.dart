import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import 'mapUtility.dart';

class Locationn extends StatefulWidget {
  const Locationn({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Locationn> {
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);

  Set<Marker> markers = {};
  Set<Polyline> _polyline = Set<Polyline>();
  Set<Polygon> _polygon = Set<Polygon>();
  int polycounter = 1;

  List<LatLng> polycord = [];
  late PolylinePoints polypoints;

  //late Marker _current;

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
  //late Directions _info;

  @override
  initState() {
    super.initState();
    polypoints = PolylinePoints();
    initBle();
    scan();
    currentlocation();
  }

  void initBle() {
    flutterBlue.isScanning.listen((isScanning) {
      _isScanning = isScanning;

      setState(() {});
    });
  }

  scan() async {
    if (!_isScanning) {
      scanResultList.clear();

      flutterBlue.startScan(timeout: Duration(seconds: 4));

      flutterBlue.scanResults.listen((results) {
        scanResultList = results;
        for (ScanResult r in results) {
          if (r.device.name == "tkr") {
            rssi_val = r.rssi;
            found = true;
            cal();
          }
        }
        print("*****");
        print(rssi_val);

        setState(() {});
      });
    } else {
      flutterBlue.stopScan();
    }

    //dis =;
  }

  void cal() {
    if (found) {
      print("distance is :");
      dis = pow(10, (((measured_Dis - (rssi_val)) / (10 * 2)))) as double;

      distance = dis.ceil();
      print(distance);
    } else {
      print("devices not found! check connection");
    }
  }

  void currentlocation() async {
    Position position = await _determinePosition();
    latt2 = position.latitude;
    longg2 = position.longitude;
    // Map<String,dynamic> boundsNe,Map<String,dynamic> boundsSw

    /* final CameraPosition _mylocation = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 14.4746,
    );*/
    googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 14.4746,
    )));

    final Marker _mylocationmarker = Marker(
      markerId: MarkerId('Current'),
      infoWindow: InfoWindow(title: 'Current location'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(position.latitude, position.longitude),
    );

    latt = lat(position.latitude);
    longg = long(position.longitude);

    /*   final CameraPosition _destination = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(35.2219, 33.4166),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);*/

    googleMapController.animateCamera(CameraUpdate.newLatLngBounds(
        LatLngBounds(
            southwest: LatLng(position.latitude, position.longitude),
            northeast: LatLng(latt, longg)),
        25));

    final Marker _destinationmarker = Marker(
      markerId: MarkerId('Destination'),
      infoWindow: InfoWindow(title: 'Destination'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(latt, longg),
    );
    markers.add(_mylocationmarker);
    markers.add(_destinationmarker);

    final Polyline _kpolyline = Polyline(
        polylineId: PolylineId('_kpolyline'),
        points: [
          LatLng(position.latitude, position.longitude),
          LatLng(latt, longg),
          //LatLng(35.2219, 33.4166),
        ],
        width: 4,
        color: Colors.red);
    _polyline.add(_kpolyline);
    final Polygon _kpolygon = Polygon(
      polygonId: PolygonId('_Kpolygon'),
      points: [
        LatLng(position.latitude, position.longitude),
        LatLng(latt, longg),
        // LatLng(35.2219, 33.4166),
      ],
      strokeWidth: 4,
      fillColor: Colors.transparent,
    );
    _polygon.add(_kpolygon);
    _getdirections(
        LatLng(position.latitude, position.longitude), LatLng(latt, longg));
    //shoemaps(latt, longg);

    setState(() {});
  }

  Future<void> _getdirections(LatLng first, LatLng second) async {
    String key = "AIzaSyCNBc56b_XnfpT7zZ3e2-QjwqHfM2lP13I";
    print("JSON  Is**********************\n");
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User current location"),
        centerTitle: true,
      ),
      body: Container(
        child: TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            shoemaps(latt, longg);
          },
          child: Text("Open"),
        ),
      ),
    );
  }

  Future<void> shoemaps(double lat, double long) async {
    String google =
        "https//www.google.com/maps/search/?api=1&query=$latt,$longg";
    if (await canLaunch(google)) {
      await launch(google);
    } else {
      throw 'Could not launch';
    }
  }

  void showpoly() async {
    PolylineResult res = await polypoints.getRouteBetweenCoordinates(
        "AIzaSyCNBc56b_XnfpT7zZ3e2-QjwqHfM2lP13I",
        PointLatLng(latt2, longg2),
        // PointLatLng(35.2219, 33.4166));
        PointLatLng(latt, longg));
    if (res.status == 'OK') {
      res.points.forEach((PointLatLng point) {
        polycord.add(LatLng(point.latitude, point.longitude));
      });
    }
    print("^^^^^^^^^*********................");
    setState(() {
      _polyline.add(Polyline(
          width: 5,
          polylineId: const PolylineId('polyline'),
          color: Colors.red,
          points: polycord));
    });
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

/*class MapUtils {
  MapUtils._();

  static Future<void> shoemaps(double lat, double long) async {
    String google = "https//www.google.com/maps/search/?api=1&query=$lat,$long";
    if (await canLaunch(google)) {
      await launch(google);
    } else {
      throw 'Could not launch';
    }
  }
}*/
