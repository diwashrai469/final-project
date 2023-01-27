import 'package:flutter/material.dart';

//shows alert dialog in screen
class myAlertDialog extends StatelessWidget {
  String? anotherText;
  String text;
  final void Function()? onPressed;
  myAlertDialog(
      {super.key,
      required this.text,
      required this.onPressed,
      this.anotherText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: anotherText == null ? null : Text(anotherText.toString()),
        content: Text(text),
        actions: [
          TextButton(
            onPressed: onPressed,
            child: Text('OK'),
          ),
        ]);
  }
}
