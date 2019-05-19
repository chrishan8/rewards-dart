import 'package:flutter/material.dart';

// Classes
import '../classes/prize.dart';
// Widgets
import 'prizeItem.dart';

class ProgressWidget extends StatefulWidget {
  ProgressWidget({ Key key, this.onChangeMode }) : super(key: key);

  final VoidCallback onChangeMode;

  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<ProgressWidget> {
  final Prize _nextPrize = new Prize(
    id: '3',
    name: 'Flat Iron',
    description: '1 Free Hot Beauty 1in Flat Iron',
    value: 400
  );

  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          LinearProgressIndicator(
            value: 0.5
          ),
          PrizeItemWidget(
            prize: _nextPrize
          ),
          Divider(),
          ListTile(
            leading: Text('3'),
            title: Text('Prizes Available'),
            subtitle: Text('Redeem points for prizes'),
            trailing: Icon(Icons.arrow_forward),
            onTap: widget.onChangeMode
          )
        ],
      )
    );
  }
}