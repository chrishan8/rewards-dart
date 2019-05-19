import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
// Widgets
import '../widgets/contact.dart';
import '../widgets/keypad.dart';
import '../widgets/progress.dart';
import '../widgets/prizeList.dart';
// Stores
import '../stores/customer/customer.dart';

class CustomerPageWidget extends StatefulWidget {
  CustomerPageWidget({ Key key }) : super(key: key);

  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPageWidget> {
  final TextEditingController _keypadInputCtrl = new TextEditingController();

  void onComplete() {

  }

  Widget _buildControlWidget(CustomerStore store) {
    return Observer(
      builder: (_) {
        switch(store.mode) {
          case ActionsMode.addPoints:
            return KeypadWidget(
              label: 'Points',
              inputCtrl: _keypadInputCtrl
            );
            break;
          case ActionsMode.redeemPrizes:
            return PrizeListWidget();
            break;
          default:
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<CustomerStore>(context);
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              ContactWidget(),
              ProgressWidget()
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              _buildControlWidget(store)
            ],
          ),
        ),
      ],
    );
  }
}