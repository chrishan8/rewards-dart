import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
// Classes
import '../classes/prize.dart';
// Widgets
import 'prizeItem.dart';
// Stores
import '../stores/customer/customer.dart';
import '../stores/prizes/prizes.dart';

class ProgressWidget extends StatelessWidget {
  final Prize _nextPrize = new Prize(
    id: '3',
    name: 'Flat Iron',
    description: '1 Free Hot Beauty 1in Flat Iron',
    value: 1000
  );

  ProgressWidget({ Key key }) : super(key: key);

  List<Widget> buildNextPrizeItem(CustomerStore customerStore, PrizesStore prizesStore) {
    if (prizesStore.nextPrize != null) {
      return [
        LinearProgressIndicator(
          value: customerStore.currentCustomer['points'] / prizesStore.nextPrize.value
        ),
        PrizeItemWidget(
          prize: prizesStore.nextPrize,
          totalPoints: customerStore.currentCustomer['points']
        ),
      ];
    }
    return [];
  }

  List<Widget> buildRedeemItem(CustomerStore customerStore, PrizesStore prizesStore) {
    final int _availablePrizeCount = prizesStore.availablePrizes.length;
    if (_availablePrizeCount > 0) {
      return [
        LinearProgressIndicator(
          value: 1.0,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen),
        ),
        ListTile(
          leading: Column(
            children: <Widget>[
              Icon(Icons.card_giftcard),
              Text(
                _availablePrizeCount.toString(),
                style: TextStyle(
                  fontSize: 16
                )
              ),
            ]
          ),
          title: Text('Available'),
          trailing: Icon(Icons.arrow_forward),
          onTap: () => customerStore.setMode(ActionsMode.redeemPrizes)
        )
      ];
    }
    return [];
  }

  Widget build(BuildContext context) {
    final customerStore = Provider.of<CustomerStore>(context);
    final prizesStore = Provider.of<PrizesStore>(context);
    return Observer(
      builder: (_) {
        return Card(
          child: Column(
            children: <Widget>[
              ...buildNextPrizeItem(customerStore, prizesStore),
              ...buildRedeemItem(customerStore, prizesStore)
            ],
          )
        );
      }
    );
  }
}