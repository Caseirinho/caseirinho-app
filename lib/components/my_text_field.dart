import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  final obscureText;
  final hintText;
  final onChanged;
  final sufixIcon;
  final maxLines;
  final inputFormatters;
  final keyboardType;

  final controller;

  const MyTextField({
    Key key,
    this.labelText,
    this.onChanged,
    this.obscureText = false,
    this.hintText = "",
    this.sufixIcon,
    this.maxLines,
    this.inputFormatters,
    this.keyboardType,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      obscureText: this.obscureText,
      keyboardType: keyboardType,
      controller: controller,
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
