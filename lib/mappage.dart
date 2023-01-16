import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class mymap extends StatefulWidget {
  const mymap({super.key});

  @override
  State<mymap> createState() => _mymapState();
}

class _mymapState extends State<mymap> {
  final Completer<GoogleMapController> _controller = Completer();
  final List<Marker> _markers = <Marker>[];

  loadcurretlocation() {
    _determinePosition().then((value) async {
      _markers.add(Marker(
          markerId: const MarkerId('2'),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: const InfoWindow(title: "My current location")));
      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 14,
      );
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    loadcurretlocation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                Icon(
                  Icons.image,
                  color: Colors.red,
                  size: 50,
                ),
                Builder(builder: (context) {
                  return ElevatedButton(
                      onPressed: () {
                        Scaffold.of(context).closeDrawer();
                      },
                      child: Icon(Icons.close));
                }),
                Text(
                  'Full Name',
                ),
                Text(
                  'Address',
                ),
                Divider(
                  color: Colors.black,
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'First Menu',
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Second Menu',
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Third Menu',
                    ),
                  ),
                ),
              ],
            ),
          ),
          onDrawerChanged: (val) {
            print(val);
          },
          appBar: AppBar(
            leading: Card(
              elevation: 3,
              child: Builder(
                builder: (ctx) {
                  return IconButton(
                      onPressed: () {
                        Scaffold.of(ctx).openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.black,
                      ));
                },
              ),
            ),
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () {
                          print(("restaurant"));
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.restaurant,
                              color: Colors.black,
                            ),
                            Text(
                              "Restaurant",
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: () {
                            print(("hotel"));
                          },
                          child: Row(
                            children: const [
                              Icon(
                                Icons.hotel,
                                color: Colors.black,
                              ),
                              Text(
                                "Hotel",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: GoogleMap(
              myLocationEnabled: true,
              onTap: (value) {},
              myLocationButtonEnabled: true,
              mapType: MapType.hybrid,
              markers: Set<Marker>.of(_markers),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              initialCameraPosition:
                  CameraPosition(target: LatLng(27.6710, 85.4298), zoom: 14))),
    );
  }
}

Future<Position> _determinePosition() async {
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
