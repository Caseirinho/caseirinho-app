import 'package:flutter/material.dart';

class MyFlatButton extends StatelessWidget {
  final String label;
  final onPressed;

  const MyFlatButton({
    Key key,
    this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: this.onPressed,
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
