import 'package:flutter/material.dart';
import 'keypad.dart';
import 'keypad-button.dart';

class NumericKeypadWidget extends StatefulWidget {
  NumericKeypadWidget({Key key, String input }) : super(key: key);

  final String input = '';

  @override
  _NumericKeypadState createState() => _NumericKeypadState();
}

class _NumericKeypadState extends State<NumericKeypadWidget> implements KeypadState {

  final double _fontSize = 20;
  TextEditingController inputCtrl = new TextEditingController();

  void onAppend(String value) {
    setState(() {
      inputCtrl.text += value;
    });
  }

  void onClear() {
    setState(() {
      inputCtrl.text = '';
    });
  }

  void onDel() {
    if (inputCtrl.text.length > 0) {
      setState(() {
        inputCtrl.text = inputCtrl.text.substring(0, inputCtrl.text.length - 1);
      });
    }
  }

  void onSubmit() {
    onClear();
  }

  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Phone Number'
          ),
          controller: inputCtrl
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  KeypadButton(
                    value: '7',
                    onPressed: () => onAppend('7'),
                  ),
                  KeypadButton(
                    value: '4',
                    onPressed: () => onAppend('4'),
                  ),
                  KeypadButton(
                    value: '1',
                    onPressed: () => onAppend('1'),
                  ),
                  KeypadButton(
                    icon: Icon(Icons.arrow_back),
                    value: 'Del',
                    onPressed: () => onDel(),
                  )
                ]
              )
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  KeypadButton(
                    value: '8',
                    onPressed: () => onAppend('8'),
                  ),
                  KeypadButton(
                    value: '5',
                    onPressed: () => onAppend('5'),
                  ),
                  KeypadButton(
                    value: '2',
                    onPressed: () => onAppend('2'),
                  ),
                  KeypadButton(
                    value: '0',
                    onPressed: () => onAppend('0'),
                  )
                ],
              )
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  KeypadButton(
                    value: '9',
                    onPressed: () => onAppend('9'),
                  ),
                  KeypadButton(
                    value: '6',
                    onPressed: () => onAppend('6'),
                  ),
                  KeypadButton(
                    value: '3',
                    onPressed: () => onAppend('3'),
                  ),
                  KeypadButton(
                    icon: Icon(Icons.clear),
                    value: 'Clear',
                    onPressed: () => onClear(),
                  )
                ],
              )
            )
          ]
        ),
        RaisedButton(
          onPressed: () => onSubmit(),
          child: Text(
            'Submit',
            style: TextStyle(fontSize: _fontSize)
          ),
        )
      ]
    );
  }
}