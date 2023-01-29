import 'package:flutter/material.dart';

//shows content of 2nd page of rating
class ratingDialogContent2 extends StatefulWidget {
  const ratingDialogContent2({super.key});

  @override
  State<ratingDialogContent2> createState() => _ratingDialogContent2State();
}

class _ratingDialogContent2State extends State<ratingDialogContent2> {
  int selectedChipIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
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
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Write your review here",
                    hintStyle: TextStyle(color: Colors.grey.shade400)),
              ),
            )
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
