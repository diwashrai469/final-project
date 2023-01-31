import 'dart:math';

import 'package:digital_map/models/rating_dialogbox.dart';
import 'package:flutter/material.dart';

//shows dialog box for rating

class dialogForRating extends StatefulWidget {
  const dialogForRating({super.key});

  @override
  State<dialogForRating> createState() => _dialogForRatingState();
}

class _dialogForRatingState extends State<dialogForRating> {
  PageController _ratingPageController = PageController();
  double _starposition = 200;
  double _starCount = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: Container(
        child: Stack(
          children: [
            Container(
                height: max(300, MediaQuery.of(context).size.height * 0.3),
                child: PageView(
                  //for multiple page view
                  controller: _ratingPageController,
                  children: [
                    ratingDialogContent().anotherPageContent(),
                    ratingDialogContent2(
                      newStarCount: _starCount,
                    )
                  ],
                )),

            Positioned(
              right: 0,
              child: MaterialButton(
                child: const Text(
                  "Skip",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),

            //star rating
            AnimatedPositioned(
                top: _starposition,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      5,
                      (index) => IconButton(
                            onPressed: () {
                              _ratingPageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                              setState(() {
                                _starposition = 40;
                                _starCount = index + 1;
                                print("pressed");
                              });
                            },
                            icon: index < _starCount
                                ? Icon(
                                    Icons.star,
                                    size: 32,
                                    color: Colors.red,
                                  )
                                : Icon(
                                    Icons.star_border,
                                    size: 32,
                                  ),
                          )),
                ),
                duration: Duration(milliseconds: 300))
          ],
        ),
      ),
    );
  }
}
