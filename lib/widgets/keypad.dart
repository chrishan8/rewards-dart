import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Widgets
import 'keypad-button.dart';
// Stores
import '../stores/customer/customer.dart';

class KeypadWidget extends StatefulWidget {
  KeypadWidget({Key key, @required this.label, @required this.inputCtrl }) : super(key: key);

  final String label;
  final TextEditingController inputCtrl;

  @override
  _KeypadState createState() => _KeypadState();
}

class _KeypadState extends State<KeypadWidget> {
  void onAppend(String value) {
    setState(() {
      widget.inputCtrl.text += value;
    });
  }

  void onAdd() {
    setState(() {
      widget.inputCtrl.text = '';
    });
  }

  void onDel() {
    final String input = widget.inputCtrl.text;
    if (input.length > 0) {
      setState(() {
        widget.inputCtrl.text = input.substring(0, input.length - 1);
      });
    }
  }

  Widget build(BuildContext context) {
    final store = Provider.of<CustomerStore>(context);
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: widget.label
          ),
          controller: widget.inputCtrl
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                    icon: Icon(Icons.backspace),
                    value: 'Del',
                    onPressed: () => onDel(),
                  )
                ]
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                ]
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                    icon: Icon(Icons.add_box),
                    value: 'Add',
                    onPressed: () => store.addPoints(int.parse(widget.inputCtrl.text)),
                  )
                ],
              ),
            )
          ]
        ),
      ]
    );
  }
}