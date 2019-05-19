import 'package:flutter/material.dart';

class ContactWidget extends StatefulWidget {
  ContactWidget({ Key key }) : super(key: key);

  String phone = '(888) 888-8888';
  String fullName = 'Cool Beans';
  String email = 'fake@fake.com';

  @override
  _ContactState createState() => _ContactState();
}

enum MoreOption {
  undo,
  edit
}

class _ContactState extends State<ContactWidget> {

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

  Widget build(BuildContext context) {
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
          ListTile(
            leading: Icon(Icons.phone),
            title: Text(widget.phone)
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(widget.fullName)
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text(widget.email)
          ),
        ],
      )
    );
  }
}