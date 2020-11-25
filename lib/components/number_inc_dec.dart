import 'package:flutter/material.dart';

class NumberIncDec extends StatefulWidget {
  final min;
  final max;
  final value;
  final onChange;

  const NumberIncDec(
      {Key key, this.min = 1, this.max = 10, this.value, this.onChange})
      : super(key: key);

  @override
  _NumberIncDecState createState() => _NumberIncDecState();
}

class _NumberIncDecState extends State<NumberIncDec> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () => setState(() {
              if (this.widget.value > this.widget.min)
                this.widget.onChange(this.widget.value - 1);
            }),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Text("-"),
            ),
          ),
          Text(
            "${this.widget.value}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () => setState(() {
              if (this.widget.value < this.widget.max)
                this.widget.onChange(this.widget.value + 1);
            }),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Text("+"),
            ),
          ),
        ],
      ),
    );
  }
}
