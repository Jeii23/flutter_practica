import 'package:flutter/material.dart';
import 'package:exercise_flutter_acs/data.dart';

class InfoGroups extends StatefulWidget {
  final User user;

  InfoGroups({Key? key, required this.user}) : super(key: key);

  @override
  _InfoGroupsState createState() => _InfoGroupsState();
}

class _InfoGroupsState extends State<InfoGroups> {
  late User user;

  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text('Info '+user.name),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50.0), // Ajusta el valor de 'top' según tus necesidades
        child: Form(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 50.0), // Ajusta el valor de 'bottom' según tus necesidades
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'name_User',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,),
                    ),
                    child: TextFormField(
                      initialValue: user.name,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 50.0), // Ajusta el valor de 'bottom' según tus necesidades
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Credential',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,),
                    ),
                    child: TextFormField(
                      initialValue: user.credential,
                    ),
                  ),
                ),
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
          ),
        ),
      ),
    );
  }
}
