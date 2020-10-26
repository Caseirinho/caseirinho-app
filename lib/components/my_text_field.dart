import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  final obscureText;
  final hintText;
  final onChanged;

  final sufixIcon;

  const MyTextField({
    Key key,
    this.labelText,
    this.onChanged,
    this.obscureText = false,
    this.hintText = "",
    this.sufixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: this.obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: sufixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
