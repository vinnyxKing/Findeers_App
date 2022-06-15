import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'directionsdefined.dart';

class DirectionsResp {
  static const String _url =
      'https://maps.googleleapis.com/maps/api/directions/json?';

  late final Dio _dio;
  // DirectionsResp({}) : _dio = dio;

  Future<Directions> getDirections({
    required LatLng origin,
    required LatLng destin,
  }) async {
    final response = await _dio.get(_url, queryParameters: {
      'origin': '${origin.latitude},${origin.longitude}',
      'destination': '${destin.latitude},${destin.longitude}',
      'key': 'AIzaSyCNBc56b_XnfpT7zZ3e2-QjwqHfM2lP13I',
    });

    if (response.statusCode == 200) {
      return Directions.fromMap(response.data);
    }

    return Future.error('Direction error');
  }
}
