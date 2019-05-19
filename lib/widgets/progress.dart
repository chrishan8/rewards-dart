import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
// Classes
import '../classes/prize.dart';
// Widgets
import 'prizeItem.dart';
// Stores
import '../stores/customer.dart';

class ProgressWidget extends StatelessWidget {
  final Prize _nextPrize = new Prize(
    id: '3',
    name: 'Flat Iron',
    description: '1 Free Hot Beauty 1in Flat Iron',
    value: 1000
  );

  ProgressWidget({ Key key }) : super(key: key);

  Widget build(BuildContext context) {
    final store = Provider.of<CustomerStore>(context);
    return Observer(
      builder: (_) => Card(
        child: Column(
          children: <Widget>[
            LinearProgressIndicator(
              value: store.currentCustomer['points'] / _nextPrize.value
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
              onTap: () => store.setMode(ActionsMode.redeemPrizes)
            )
          ],
        )
      )
    );
  }
}