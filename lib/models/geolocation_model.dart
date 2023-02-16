import 'package:geolocator/geolocator.dart';
//gives the current location of the users

class GeolocationModel {
  Future<Position> determinePosition() async {
    bool serviceEnable;
    LocationPermission permission;
    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error("location service are disabled");
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      return Future.error("location permision denied");
    }

    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  getDestinationLocation() async {
    Position? destinationPosition = await Geolocator.getLastKnownPosition();
    return destinationPosition;
  }
}
