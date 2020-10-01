import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyOutlineButton extends StatelessWidget {
  final String label;
  final onPressed;

  const MyOutlineButton({
    Key key,
    this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    return OutlineButton(
      onPressed: this.onPressed,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          label,
          style: TextStyle(color: color),
        ),
      ),
      borderSide: BorderSide(
        color: color,
        style: BorderStyle.solid,
        width: 2.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
