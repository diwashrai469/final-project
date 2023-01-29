import 'package:flutter/material.dart';

//custome reusuable buttons

class CustomeButton extends StatelessWidget {
  final void Function()? onPressed;
  String buttonName;
  bool isloading;

  CustomeButton(
      {super.key,
      this.onPressed,
      required this.buttonName,
      this.isloading = false});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: isloading
          ? SizedBox(
              height: 15,
              width: 15,
              child: CircularProgressIndicator(),
            )
          : Text(
              buttonName,
              style: TextStyle(color: Colors.white),
            ),
    );
  }
}
