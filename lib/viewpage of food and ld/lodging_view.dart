import 'package:digital_map/NearByPlace.dart';
import 'package:flutter/material.dart';

//this page shows all nearby lodge by passing value lodge

class LodgeView extends StatefulWidget {
  const LodgeView({super.key});

  @override
  State<LodgeView> createState() => _RestaurantViewState();
}

class _RestaurantViewState extends State<LodgeView> {
  @override
  Widget build(BuildContext context) {
    return NearByPlacesScreen(
      place: "lodging",
      topic: "Nearby Lodge",
    );
  }
}
