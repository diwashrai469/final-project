import 'package:flutter/material.dart';
//model for textfiedl

class TextFieldView extends StatelessWidget {
  String labeltext;
  Icon icon;
  bool obscuretext;
  final void Function()? onPressedEye;
  String hintText;
  final String? Function(String?)? validator;

  TextFieldView({
    Key? key,
    this.validator,
    required this.labeltext,
    required this.icon,
    required this.hintText,
    this.obscuretext = false,
    this.onPressedEye,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextFormField(
        validator: validator,
        obscureText: obscuretext as bool,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Padding(padding: EdgeInsets.all(8.0), child: icon),
          labelText: labeltext,
          suffixIcon: hintText.toLowerCase() == 'password'
              ? IconButton(
                  icon: Icon(
                      //for obscuretext true and false with icons
                      obscuretext ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black),
                  onPressed: onPressedEye,
                )
              : null,
        ),
      ),
    );
  }
}
