import 'package:flutter/material.dart';

// Classes
import '../classes/prize.dart';

class PrizeItemWidget extends StatelessWidget {
  PrizeItemWidget({ this.onTap, @required this.prize, this.selected = false, this.totalPoints });

  final VoidCallback onTap;
  final Prize prize;
  final bool selected;
  final int totalPoints;

  @override
  Widget build(BuildContext context) {
    String trailingText = totalPoints == null ? prize.value.toString() : '${totalPoints.toString()} / ${prize.value.toString()}';
    return ListTile(
      leading: Icon(Icons.card_giftcard),
      title: Text(prize.name),
      subtitle: Text(prize.description),
      trailing: Text(trailingText),
      selected: selected,
      onTap: onTap
    );
  }
}