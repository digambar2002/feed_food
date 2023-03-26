import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';

class GetLocatinState {
  loc.LocationData? locationData;
  List<Placemark>? placemark;

  void getLatLong() async {
    locationData = await loc.Location.instance.getLocation();
  }

  getAddress() async {
    locationData = await loc.Location.instance.getLocation();
    Map<String, dynamic?> data;
    if (locationData != null) {
      placemark = await placemarkFromCoordinates(
          locationData!.latitude!, locationData!.longitude!);

      data = {
        'lattitude': locationData!.latitude,
        'longitude': locationData!.longitude,
        'zip_code': placemark![0].postalCode,
        'locality': placemark![0].locality,
        'country': placemark![0].country
      };

      return data;
    }
  }

  void getPermission() async {
    if (await Permission.location.isGranted) {
      //  if location permission is granted
      getAddress();
    } else {
      // not then request permission
      Permission.location.request();
    }
  }
}
