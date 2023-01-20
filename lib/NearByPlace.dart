import 'dart:convert';

import 'package:digital_map/api%20folder/api_from_rapid.dart';
import 'package:digital_map/model%20for%20respnse/place.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NearByPlacesScreen extends StatefulWidget {
  const NearByPlacesScreen({Key? key}) : super(key: key);

  @override
  State<NearByPlacesScreen> createState() => _NearByPlacesScreenState();
}

class _NearByPlacesScreenState extends State<NearByPlacesScreen> {
  List myplacelist = [];
  void getNearbyPlaces() async {
    var uri = Uri.https('trueway-places.p.rapidapi.com', '/FindPlacesNearby', {
      "location": "27.7172,85.3240",
      "type": "restaurant",
      "radius": "150",
      "language": "en"
    });

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "74b4f14334msha990350646a5892p1bd3bejsn63e2fa695c91",
      "X-RapidAPI-Host": "trueway-places.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    myplacelist = data['results'];
  }

  @override
  void initState() {
    setState(() {
      getNearbyPlaces();
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Places'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: myplacelist.length,
              itemBuilder: (context, index) {
                return myplacelist.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                            child: Column(
                          children: [
                            Text(
                              myplacelist[index]['name'].toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              myplacelist[index]['address'].toString(),
                            ),
                          ],
                        )),
                      );
              }),
        ]),
      ),
    );
  }
}
