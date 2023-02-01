import 'package:digital_map/models/Rating%20and%20feedback/RatingAndFeedback_model.dart';
import 'package:digital_map/models/firebase/firestore.dart';
import 'package:flutter/material.dart';

//shows content of 2nd page of rating
class ratingDialogContent2 extends StatefulWidget {
  double newStarCount;

  ratingDialogContent2({
    super.key,
    required this.newStarCount,
  });

  @override
  State<ratingDialogContent2> createState() => _ratingDialogContent2State();
}

class _ratingDialogContent2State extends State<ratingDialogContent2> {
  TextEditingController _feedbackController = TextEditingController();
  final firebaseFirestoreService = FirebaseFirestoreService();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.red,
              child: MaterialButton(
                child: const Text(
                  "Done",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  ratingFeedback rating = ratingFeedback(
                      feedbacks: _feedbackController.text,
                      rating: widget.newStarCount.toString());
                  firebaseFirestoreService.storeUser(rating);

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Thank you for your Rating and feedbacks"),
                    duration: Duration(seconds: 2),
                  ));

                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
            )),
        Visibility(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "What could be better?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _feedbackController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Write your review here",
                    hintStyle: TextStyle(color: Colors.grey.shade400)),
              ),
            ),
          ],
        ))
      ],
    );
  }
}

//shows the content in dialog box
class ratingDialogContent {
  final void Function()? onPressed;
  ratingDialogContent({this.onPressed});
  int selectedChipIndex = -1;

  anotherPageContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "Thank you for your visit",
          style: TextStyle(
            color: Colors.red,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text("We would loved to get your feedback"),
        Text("How was your experiance")
      ],
    );
  }

  //content of page 2
}
