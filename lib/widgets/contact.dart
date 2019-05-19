import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
// Stores
import '../stores/customer/customer.dart';

enum MoreOption {
  undo,
  edit
}

class ContactWidget extends StatelessWidget {
  ContactWidget({ Key key }) : super(key: key);

  void onClose() {

  }

  void onEdit() {
    
  }

  void onUndo() {

  }

  void onMoreSelection(MoreOption selection) {
    switch (selection) {
      case MoreOption.undo:
        onUndo();
        break;
      case MoreOption.edit:
        onEdit();
        break;
      default:
    }
  }

  Widget buildInfoTiles(CustomerStore store) {
    return Observer(
      builder: (_) {
        if (store.currentCustomer == null) {
          return ListTile(
            leading: Icon(Icons.store),
            title: Text('No customer present')
          );
        }
        return Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.person),
              title: Text(store.currentCustomer['name'])
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(store.currentCustomer['phone'])
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text(store.currentCustomer['email'])
            ),
          ]
        );
      }
    );
  }

  Widget build(BuildContext context) {
    final store = Provider.of<CustomerStore>(context);
    return Card(
      child: Column(
        children: <Widget>[
          ButtonTheme.bar(
            child: ButtonBar(
              children: <Widget>[
                PopupMenuButton(
                  onSelected: onMoreSelection,
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<MoreOption>>[
                    const PopupMenuItem<MoreOption>(
                      value: MoreOption.undo,
                      child: ListTile(
                        leading: Icon(Icons.undo),
                        title: Text('Undo')
                      )
                    ),
                    const PopupMenuItem<MoreOption>(
                      value: MoreOption.edit,
                      child: ListTile(
                        leading: Icon(Icons.edit),
                        title: Text('Edit')
                      )
                    ),
                  ],
                ),
              ],
            ),
          ),
          buildInfoTiles(store)
        ],
      )
    );
  }
}