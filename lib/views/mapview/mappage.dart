import 'dart:async';
import 'dart:ffi';

//view google map and current location of the user

import 'package:digital_map/models/geolocation_model.dart';
import 'package:digital_map/views/drawer/drawer.dart';
import 'package:digital_map/views/viewpage%20of%20food%20and%20ld/lodging_view.dart';
import 'package:digital_map/views/viewpage%20of%20food%20and%20ld/restaurant_view.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class mymap extends StatefulWidget {


  mymap({super.key});

  @override
  State<mymap> createState() => _mymapState();
}

class _mymapState extends State<mymap> {
  final Completer<GoogleMapController> _controller = Completer();
  final List<Marker> _markers = <Marker>[];
  final mygeoloactor = GeolocationModel();

  loadcurretlocation() {
    //for finding current loacation and marking it.
    mygeoloactor.determinePosition().then((value) async {
    
      _markers.add(Marker(
          markerId: const MarkerId('2'),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: const InfoWindow(title: "My current location")));
      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 15,
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
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            drawer: myDrawer(),
            onDrawerChanged: (val) {
              print(val);
            },
            appBar: AppBar(
              backgroundColor: Colors.grey.shade50,
              elevation: 0,
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
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RestaurantView()),
                              );
                            });
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
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LodgeView()),
                                );
                              });
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.hotel,
                                  color: Colors.black,
                                ),
                                Text(
                                  "Lodge",
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
                mapType: MapType.terrain,
                markers: Set<Marker>.of(_markers),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                initialCameraPosition: const CameraPosition(
                    target: LatLng(27.6710, 85.4298), zoom: 15))),
      ),
    );
  }
}
