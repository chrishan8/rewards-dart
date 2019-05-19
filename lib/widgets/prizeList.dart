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

class PrizeListWidget extends StatelessWidget {
  PrizeListWidget({ Key key }) : super(key: key);

  Widget buildPrizeList(PrizesStore prizesStore) {
    return Observer(
      builder: (_) => Column(
        children: prizesStore.availablePrizes.map((Prize p) => PrizeItemWidget(
          onTap: () => prizesStore.onSelect(p),
          prize: p,
          selected: prizesStore.selectedPrizes.containsKey(p.id)
        )).toList()
      )
    );
  }

  Widget build(BuildContext context) {
    final customerStore = Provider.of<CustomerStore>(context);
    final prizesStore = Provider.of<PrizesStore>(context);
    return Card(
      child: Column(
        children: <Widget>[ 
          ButtonTheme.bar(
            child: ButtonBar(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => customerStore.setMode(ActionsMode.addPoints),
                )
              ]
            )
          ),
          buildPrizeList(prizesStore) 
        ]
      )
    );
  }
}