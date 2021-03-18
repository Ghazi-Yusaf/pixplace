import 'package:geolocator/geolocator.dart';
import 'package:geocode/geocode.dart';

class Location {

  static Future<Position> currentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permantly denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  static Future<String> getAddress() async {
    Position position = await Geolocator.getCurrentPosition();
    Address address = await GeoCode().reverseGeocoding(latitude: position.latitude, longitude: position.longitude);
    return '${address.city}, ${address.countryName}';
  }
}