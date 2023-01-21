import 'package:digital_map/NearByPlace.dart';
import 'package:flutter/material.dart';

//this page shows all nearby restaurant by passing value restaurant

class RestaurantView extends StatefulWidget {
  const RestaurantView({super.key});

  @override
  State<RestaurantView> createState() => _RestaurantViewState();
}

class _RestaurantViewState extends State<RestaurantView> {
  @override
  Widget build(BuildContext context) {
    return NearByPlacesScreen(
      place: "restaurant",
      topic: "Nearby Restaurants",
    );
  }
}
