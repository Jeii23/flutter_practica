import 'package:flutter/material.dart';
import 'package:exercise_flutter_acs/data.dart';

class ActionsInfo extends StatefulWidget {
  final UserGroup userGroup;

  ActionsInfo({Key? key, required this.userGroup}) : super(key: key);

  @override
  _ActionsInfoState createState() => _ActionsInfoState();
}

class _ActionsInfoState extends State<ActionsInfo> {
  late UserGroup userGroup;

  @override
  void initState() {
    super.initState();
    userGroup = widget.userGroup;
  }

  bool Open = false;
  bool Close = false;
  bool Lock = false;
  bool Unlock = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text('Actions ' + userGroup.name),
      ),
      body: Column(
        children: <Widget>[
          CheckboxListTile(
            value: Open,
            onChanged: (bool? value) {
              setState(() {
                Open = value!;
              });
            },
            title: Text('Open'),
            subtitle: Text('Opens an unlock door'),
          ),
          Divider(),
          CheckboxListTile(
            value: Close,
            onChanged: (bool? value) {
              setState(() {
                Close = value!;
              });
            },
            title: Text('Close'),
            subtitle: Text('Close an unlock door'),
          ),
          Divider(),
          CheckboxListTile(
            value: Lock,
            onChanged: (bool? value) {
              setState(() {
                Lock = value!;
              });
            },
            title: Text('Lock'),
            subtitle: Text('Locks an unlock door'),
          ),
          Divider(),
          CheckboxListTile(
            value: Unlock,
            onChanged: (bool? value) {
              setState(() {
                Unlock = value!;
              });
            },
            title: Text('Unlock'),
            subtitle: Text('Unlocks an lock door'),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Acción al pulsar el botón
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Saved')),
                );
              },
              child: Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
