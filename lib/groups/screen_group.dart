import 'package:flutter/material.dart';
import 'package:exercise_flutter_acs/data.dart';
import 'info.dart';
import 'schedule.dart';
import 'actions.dart';
import 'user_groups.dart';
class ScreenGroup extends StatefulWidget {
  final UserGroup userGroup;

  ScreenGroup({Key? key, required this.userGroup}) : super(key: key);

  @override
  _ScreenGroupState createState() => _ScreenGroupState();
}

class _ScreenGroupState extends State<ScreenGroup> {
  late UserGroup userGroup;

  @override
  void initState() {
    super.initState();
    userGroup = widget.userGroup;
  }
  double sizeIcons = 50;
  @override
  Widget build(BuildContext context) {
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
        title: Text("Group "+userGroup.name),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2, // Número de columnas
          children: <Widget>[
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Ink(
                      decoration: ShapeDecoration(
                        color: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.description_outlined,size: sizeIcons,),
                        color: Colors.white, // Cambia el color del icono si es necesario
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute<void>(
                              builder: (context) => Info(userGroup: userGroup)),
                          )
                              .then((var v) => setState(() {}));
                        },
                      ),
                    ),
                    Text('info'), // Texto debajo del botón
                  ],
                ),
              ),
            ),
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Ink(
                      decoration: ShapeDecoration(
                        color: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.calendar_month,size: sizeIcons,),
                        color: Colors.white, // Cambia el color del icono si es necesario
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute<void>(
                              builder: (context) => ScheduleInfo(userGroup: userGroup)),
                          )
                              .then((var v) => setState(() {}));
                        },
                      ),
                    ),
                    Text('Schedule'), // Texto debajo del botón
                  ],
                ),
              ),
            ),
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Ink(
                      decoration: ShapeDecoration(
                        color: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.door_back_door,size: sizeIcons,),
                        color: Colors.white, // Cambia el color del icono si es necesario
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute<void>(
                              builder: (context) => ActionsInfo(userGroup: userGroup)),
                          )
                              .then((var v) => setState(() {}));
                        },
                      ),
                    ),
                    Text('actions'), // Texto debajo del botón
                  ],
                ),
              ),
            ),
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Ink(
                      decoration: ShapeDecoration(
                        color: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.house,size: sizeIcons,),
                        color: Colors.white, // Cambia el color del icono si es necesario
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute<void>(
                              builder: (context) => ScheduleInfo(userGroup: userGroup)),
                          )
                              .then((var v) => setState(() {}));
                        },
                      ),
                    ),
                    Text('Places'), // Texto debajo del botón
                  ],
                ),
              ),
            ),
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Ink(
                      decoration: ShapeDecoration(
                        color: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.supervised_user_circle,size: sizeIcons,),
                        color: Colors.white, // Cambia el color del icono si es necesario
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute<void>(
                              builder: (context) => UserGroupsInfo(userGroup: userGroup)),
                          )
                              .then((var v) => setState(() {}));
                        },
                      ),
                    ),
                    Text('Users'), // Texto debajo del botón
                  ],
                ),
              ),
            ),
            // Puedes añadir más contenedores aquí para más botones
          ],
        ),
      ),
    );
  }
}
