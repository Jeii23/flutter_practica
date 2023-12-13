import 'package:flutter/material.dart';
import 'package:exercise_flutter_acs/data.dart';

class Info extends StatefulWidget {
  final UserGroup userGroup;

  Info({Key? key, required this.userGroup}) : super(key: key);

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  late UserGroup userGroup;

  @override
  void initState() {
    super.initState();
    userGroup = widget.userGroup;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text('Info '+userGroup.name),
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
                      labelText: 'name_group',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,),
                    ),
                    child: TextFormField(
                      initialValue: userGroup.name,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 50.0), // Ajusta el valor de 'bottom' según tus necesidades
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Descripción',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,),
                      ),
                    child: TextFormField(
                      initialValue: userGroup.description,
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
