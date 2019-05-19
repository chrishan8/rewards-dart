import 'package:flutter/material.dart';

class KeypadButton extends StatelessWidget {
  KeypadButton({ this.icon, this.value, @required this.onPressed });

  final Icon icon;
  final String value;
  final VoidCallback onPressed;
  final double _fontSize = 20;

  renderButtonType() {
    if (icon != null) {
      return IconButton(
        onPressed: onPressed,
        icon: icon,
        iconSize: _fontSize,
      );
    }
    return RaisedButton(
      onPressed: onPressed,
      child: Text(
        value,
        style: TextStyle(fontSize: _fontSize)
      )
    );
  }

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: renderButtonType()
    );
    // return Expanded(
    //   child: Container(
    //     width: double.infinity,
    //     child: renderButtonType()
    //   )
    // );
  }
}