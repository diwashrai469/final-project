import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:digital_map/models/Rating%20and%20feedback/RatingAndFeedback_model.dart';
import 'package:digital_map/models/geolocation_model.dart';
import 'package:digital_map/views/rating%20view/rating_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import 'firebase/firestore.dart';

//this gives the api of food and lodge
//model for restaurant view and lodging view

class NearByPlacesScreen extends StatefulWidget {
  String place;
  String topic;
  Icon icon;
  NearByPlacesScreen(
      {required this.place, required this.topic, required this.icon});

  @override
  State<NearByPlacesScreen> createState() => _NearByPlacesScreenState();
}

class _NearByPlacesScreenState extends State<NearByPlacesScreen> {
  List<dynamic> myplacelist = []; // for json response.

  final mylocator = GeolocationModel();
  final firebaseFirestoreService = FirebaseFirestoreService();

  Future<void> getNearbyPlaces() async {
    mylocator.determinePosition().then((value) async {
      double lat = value.latitude;
      double long = value.longitude;

      var uri =
          Uri.https('trueway-places.p.rapidapi.com', '/FindPlacesNearby', {
        // "location": "${lat.toString()}, ${long.toString()}",
        "location": "27.6738, 85.3595",
        "type": widget.place.toString(),
        "radius": "200 ",
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
            Map mydata = jsonDecode(response.body);
            if (mydata.isEmpty || mydata == null) {
              print("error in fetch");
            }
            myplacelist = mydata['results'];
            myplacelist.sort((a, b) {
              return a['name'].toLowerCase().compareTo(b['name'].toLowerCase());
            });
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
        title: Text(widget.topic),
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
            : Column(mainAxisSize: MainAxisSize.min, children: [
                StreamBuilder<List<ratingFeedback>>(
                    stream: firebaseFirestoreService.getAllUserRatingStream(),
                    builder: (context, snapshot) {
                      List<dynamic> newPlaceList = [];
                      List<ratingFeedback> ratingList = [];
                      if (snapshot.hasData) {
                        if (snapshot.data != null) {
                          ratingList = snapshot.data ??
                              []; // store the value of rating in variable
                        }
                      }
                      if (ratingList.isNotEmpty) {
                        newPlaceList = myplacelist.map((myPlace) {
                          double ratingValue = 0.0;
                          try {
                            final matchRating =
                                ratingList.singleWhere((element) {
                              return element.id == myPlace["id"];
                            });
                            if (matchRating != null) {
                              if (matchRating.rating != null) {
                                try {
                                  final rv =
                                      double.tryParse(matchRating.rating ?? "");
                                  ratingValue = rv ?? 0.0;
                                } catch (e) {
                                  print("error parsing double ");
                                }
                              }
                            }
                          } catch (e) {
                            print("error:$e");
                          }
                          myPlace['rating'] = ratingValue;
                          return myPlace;
                        }).toList();
                        newPlaceList.sort((a, b) {
                          return ((b['rating'] - a['rating']) as double).ceil();
                        });
                      }
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: newPlaceList.length,
                          itemBuilder: (context, index) {
                            final newData = newPlaceList[index];
                            ratingFeedback? rating;
                            double ratingValue = 0.0;
                            try {
                              final matchRating =
                                  ratingList.singleWhere((element) {
                                return element.id == newData["id"];
                              });
                              rating = matchRating;
                              if (matchRating != null) {
                                if (matchRating.rating != null) {
                                  try {
                                    final rv = double.tryParse(
                                        matchRating.rating ?? "");
                                    ratingValue = rv ?? 0.0;
                                  } catch (e) {
                                    print("error parsing double ");
                                  }
                                }
                              }
                            } catch (e) {
                              print("error:$e");
                            }
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Card(
                                  child: ListTile(
                                      leading: widget.icon,
                                      title: Text(
                                        newData['name'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            newData["address"].toString(),
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          SmoothStarRating(
                                              starCount: 5,
                                              rating: ratingValue,
                                              size: 23.0,
                                              halfFilledIconData: Icons.blur_on,
                                              color: Colors.orange,
                                              borderColor: Colors.orange,
                                              spacing: 0.0)
                                        ],
                                      ),
                                      trailing: Card(
                                        color: Colors.grey.shade100,
                                        elevation: 2,
                                        child: TextButton.icon(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return dialogForRating(
                                                      id: newData['id'],
                                                      name: newData['name'],
                                                    );
                                                  });
                                            },
                                            icon: Icon(
                                              Icons.star,
                                              color: Colors.orange.shade500,
                                            ),
                                            label: const Text("Rate us!",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ))),
                            );
                          });
                    }),
              ]),
      ),
    );
  }
}
