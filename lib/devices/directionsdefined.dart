import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class Directions {
  final LatLngBounds bounds; //centering camera view on two points
  final List<PointLatLng> polylinesPoints; //for drawing our polylines
  final String totalDistances;
  final String totalDurations;

  const Directions({
    required this.bounds,
    required this.polylinesPoints,
    required this.totalDistances,
    required this.totalDurations,
  });

  factory Directions.fromMap(Map<String, dynamic> map) {
    if ((map['routes'] as List).isEmpty) ;

    final data = Map<String, dynamic>.from(map['routes'][0]);

    final northeast = data['bounds']['northeast'];
    final southwest = data['bounds']['southwest'];
    final bounds = LatLngBounds(
      southwest: LatLng(southwest['lat'], southwest['lng']),
      northeast: LatLng(northeast['lat'], northeast['lng']),
    );

    String distance = '';
    String duration = '';
    if ((data['legs'] as List).isEmpty) {
      final leg = data['legs'][0];
      distance = leg['distance']['text'];
      duration = leg['distance']['text'];
    }

    return Directions(
      bounds: bounds,
      polylinesPoints:
          PolylinePoints().decodePolyline(data['overview_polyline']['points']),
      totalDistances: distance,
      totalDurations: duration,
    );
  }
}
