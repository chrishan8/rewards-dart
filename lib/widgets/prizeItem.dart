import 'package:flutter/material.dart';

// Classes
import '../classes/prize.dart';

class PrizeItemWidget extends StatelessWidget {
  PrizeItemWidget({ this.onTap, @required this.prize, this.selected = false });

  final VoidCallback onTap;
  final Prize prize;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.card_giftcard),
      title: Text(prize.name),
      subtitle: Text(prize.description),
      trailing: Text(prize.value.toString()),
      selected: selected,
      onTap: onTap
    );
  }
}