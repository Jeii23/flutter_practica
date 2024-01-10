import 'package:flutter/material.dart';
import 'screen_partition.dart';
import 'the_drawer.dart';
import 'tree.dart';
import 'requests.dart';
import 'dart:async';

class ScreenSpace extends StatefulWidget {
  final String id;

  const ScreenSpace({super.key, required this.id});

  @override
  State<ScreenSpace> createState() => _StateScreenSpace();
}

class _StateScreenSpace extends State<ScreenSpace> {
  late Future<Tree> futureTree;
  Timer? _timer;  // Añade esta línea

  @override
  void initState() {
    super.initState();
    futureTree = getTree(widget.id);
    _activateTimer();
  }

  void _activateTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        futureTree = getTree(widget.id);
      });
    });
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Widget _buildRow(Door door, int index) {
    return ListTile(
      leading: Icon(Icons.door_front_door),
      title: Text('${door.id}'),
      subtitle: Row(
        children: <Widget>[
          Icon(door.state == "locked" ? Icons.lock : Icons.lock_open),
          Switch(
            value: door.state == "locked",
            onChanged: (bool value) {
              String action = value ? "lock" : "unlock";
              updateDoorState(door.id, action);
              // Aquí puedes actualizar el estado de la puerta en tu aplicación
            },
          ),
          Icon(door.closed ? Icons.close : Icons.task_alt),
          Switch(
            value: door.closed,
            onChanged: (bool value) {
              String action = value ? "close" : "open";
              updateDoorState(door.id, action);
              // Aquí puedes actualizar el estado de la puerta en tu aplicación
            },
          ),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Tree>(
      future: futureTree,
      builder: (context, snapshot) {
        // anonymous function
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme
                  .of(context)
                  .colorScheme
                  .primary,
              foregroundColor: Theme
                  .of(context)
                  .colorScheme
                  .onPrimary,
              title: Text(snapshot.data!.root.id),
              actions: <Widget>[
                IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () {
                      while(Navigator.of(context).canPop()) {
                        Navigator.of(context).pop();
                      }
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (context) => ScreenPartition(id: "ROOT")
                      ));
                    }
                ),
                //TODO other actions
              ],
            ),
            body: ListView.separated(
              // it's like ListView.builder() but better because it includes a separator between items
              padding: const EdgeInsets.all(16.0),
              itemCount: snapshot.data!.root.children.length,
              itemBuilder: (BuildContext context, int i) =>
                  _buildRow(snapshot.data!.root.children[i], i),
              separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a progress indicator
        return Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ));
      },
    );
  }
}