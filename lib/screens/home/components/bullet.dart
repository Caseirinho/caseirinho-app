
import 'package:flutter/material.dart';

class Bullet extends StatelessWidget {
  final title;
  final active;
  final onPress;
  final onDismiss;

  const Bullet({
    Key key,
    this.title,
    this.active = false,
    this.onPress,
    this.onDismiss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: active ? Colors.grey.shade400 : Colors.redAccent,
      onTap: onPress,
      child: Container(
        height: 30,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: active ? Colors.redAccent : Colors.grey.shade400,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              if (this.active)
                InkWell(
                  onTap: onDismiss,
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
