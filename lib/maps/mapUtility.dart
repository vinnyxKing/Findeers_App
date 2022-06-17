import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();

  static Future<void> shoemaps(double lat, double long) async {
    String google =
        "https://www.google.com/maps/search/?api=1&query=$lat,$long";
    if (await canLaunch(google)) {
      await launch(google);
    } else {
      throw 'Could not launch';
    }
  }
}
