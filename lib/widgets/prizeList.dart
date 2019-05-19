import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Classes
import '../classes/prize.dart';
// Widgets
import 'prizeItem.dart';
// Stores
import '../stores/customer.dart';

class PrizeListWidget extends StatefulWidget {
  PrizeListWidget({ Key key }) : super(key: key);

  @override
  _PrizeListState createState() => _PrizeListState();
}

class _PrizeListState extends State<PrizeListWidget> {
  final Map<String, Prize> _prizes = {
    '0': Prize(
      id: '0',
      name: 'Flat Iron Combo',
      description: '1 Free Hot Beauty Combo Flat Iron',
      value: 100
    ),
    '1': Prize(
      id: '1',
      name: 'Flat Iron Combo',
      description: '1 Free Hot Beauty Combo Flat Iron',
      value: 200
    ),
    '2': Prize(
      id: '2',
      name: 'Flat Iron Combo',
      description: '1 Free Hot Beauty Combo Flat Iron',
      value: 300
    ),
  };
  Map<String, Prize> _selectedPrizes = {};

  int get selectedTotal {
    if (_selectedPrizes.isNotEmpty) {
      return _selectedPrizes.values.map((Prize p) => p.value)
        .reduce((int acc, int curr) => acc + curr);
    }
    return 0;
  }

  void onSelect(Prize p, int totalPoints) {
    setState(() {
      if (_selectedPrizes.containsKey(p.id)) {
        _selectedPrizes.remove(p.id);
      }
      else if (selectedTotal + p.value <= totalPoints) {
        _selectedPrizes[p.id] = p;
      }
    });
  }

  List<Widget> buildPrizeList(CustomerStore store) {
    return _prizes.entries.map((MapEntry<String, Prize> p) => PrizeItemWidget(
      onTap: () => onSelect(p.value, store.currentCustomer['points']),
      prize: p.value,
      selected: _selectedPrizes.containsKey(p.key)
    )).toList();
  }

  Widget build(BuildContext context) {
    final store = Provider.of<CustomerStore>(context);
    return Card(
      child: Column(
        children: <Widget>[ 
          ButtonTheme.bar(
            child: ButtonBar(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => store.setMode(ActionsMode.addPoints),
                )
              ]
            )
          ),
          ...buildPrizeList(store) 
        ]
      )
    );
  }
}