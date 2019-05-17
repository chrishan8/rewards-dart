import 'package:flutter/material.dart';

class KeypadButton extends StatelessWidget {
  KeypadButton({ this.icon, this.value, @required this.onPressed });

  final Icon icon;
  final String value;
  final VoidCallback onPressed;
  final double _fontSize = 20;

  renderButtonType() {
    if (icon != null) {
      return RaisedButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(
          value,
          style: TextStyle(fontSize: _fontSize)
        )
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
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: renderButtonType()
    );
  }
}