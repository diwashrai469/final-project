import 'dart:convert';
import 'dart:ffi';

import 'package:digital_map/models/geolocation_model.dart';
import 'package:digital_map/views/rating%20view/rating_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//this gives the api of food and lodge
//model for restaurant view and lodging view

class NearByPlacesScreen extends StatefulWidget {
  String place;
  String topic;
  Icon icon;
  NearByPlacesScreen(
      {required this.place, required this.topic, required this.icon});

  @override
  State<NearByPlacesScreen> createState() =>
      _NearByPlacesScreenState(place, topic, icon);
}

class _NearByPlacesScreenState extends State<NearByPlacesScreen> {
  List myplacelist = []; // for json response.
  // value of place , topic and icon is passed form restaurant_view and lodging_view.
  String place;
  String topic;
  Icon icon;
  _NearByPlacesScreenState(this.place, this.topic, this.icon);
  final mylocator = GeolocationModel();

  void getNearbyPlaces() async {
    mylocator.determinePosition().then((value) async {
      double lat = value.latitude;
      double long = value.longitude;

      var uri =
          Uri.https('trueway-places.p.rapidapi.com', '/FindPlacesNearby', {
        "location": "${lat.toString()}, ${long.toString()}",
        // "location": "27.6738, 85.3595",
        "type": place.toString(),
        "radius": "300 ",
        "language": "en"
      });

      final response = await http.get(uri, headers: {
        "X-RapidAPI-Key": "",
        "X-RapidAPI-Host": "trueway-places.p.rapidapi.com",
        "useQueryString": "true"
      });

      if (response.statusCode == 200) {
        if (mounted) {
          setState(() {
            Map data = jsonDecode(response.body);
            if (data.isEmpty || data == null) {
              print("error in fetch");
            }
            myplacelist = data['results'];
            if (myplacelist.isEmpty || myplacelist == null) {
              Text("No any data");
            } else
              null;
          });
        }
      }
    });
  }

  @override
  void initState() {
    getNearbyPlaces();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    print("app disposed");
    getNearbyPlaces(); // so that data will be disposed
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Text(topic),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: myplacelist.isEmpty
            ? const Center(
                child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ))
            : Column(children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: myplacelist.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          child: Card(
                              child: ListTile(
                                  leading: icon,
                                  title: Text(
                                    myplacelist[index]['name'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    myplacelist[index]['address'],
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  trailing: TextButton.icon(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return dialogForRating();
                                            });
                                      },
                                      icon: Icon(
                                        Icons.star,
                                        color: Colors.orange.shade500,
                                      ),
                                      label: const Text("Rate us!",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold))))),
                        ),
                      );
                    }),
              ]),
      ),
    );
  }
}