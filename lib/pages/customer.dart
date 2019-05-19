import 'package:flutter/material.dart';

// Widgets
import '../widgets/contact.dart';
import '../widgets/keypad.dart';
import '../widgets/progress.dart';
import '../widgets/prizeList.dart';

enum ActionsMode {
  addPoints,
  redeemPrizes
}

class CustomerPageWidget extends StatefulWidget {
  CustomerPageWidget({ Key key }) : super(key: key);

  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPageWidget> {
  final TextEditingController _keypadInputCtrl = new TextEditingController();
  ActionsMode _mode = ActionsMode.addPoints;

  void onComplete() {

  }

  Widget _buildControlWidget() {
    switch(_mode) {
      case ActionsMode.addPoints:
        return KeypadWidget(
          label: 'Points',
          inputCtrl: _keypadInputCtrl
        );
        break;
      case ActionsMode.redeemPrizes:
        return PrizeListWidget(
          onChangeMode: () => _onChangeMode(ActionsMode.addPoints),
        );
        break;
      default:
    }
    return null;
  }

  void _onChangeMode(ActionsMode mode) {
    setState(() {
      _mode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              ContactWidget(),
              ProgressWidget(
                onChangeMode: () => _onChangeMode(ActionsMode.redeemPrizes),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              _buildControlWidget()
            ],
          ),
        ),
      ],
    );
  }
}