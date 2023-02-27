import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';

class GetLocatin extends StatefulWidget {
  const GetLocatin({super.key});

  @override
  State<GetLocatin> createState() => _GetLocatinState();
}

class _GetLocatinState extends State<GetLocatin> {
  loc.LocationData? locationData;
  List<Placemark>? placemark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Loaction"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: _getLatLong, child: Text("get lat long")),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: _getAddress, child: Text("Get Address")),
            ],
          ),
        ),
      ),
    );
  }

  void _getLatLong() async {
    locationData = await loc.Location.instance.getLocation();
    print("lattitude: ${locationData!.latitude}");
    print("longitude: ${locationData!.longitude}");
  }

  void _getAddress() async {
    if (locationData != null) {
      placemark = await placemarkFromCoordinates(
          locationData!.latitude!, locationData!.longitude!);

      print(placemark![0].postalCode);
      print(placemark![0].locality);
      print(placemark![0].country);
    }
  }

  void getPermission() async {
    if (await Permission.location.isGranted) {
      //  if location permission is granted
    } else {
      // not then request permission
      Permission.location.request();
    }
  }
}
