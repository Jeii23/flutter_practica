import 'package:flutter/material.dart';
import 'package:weekday_selector/weekday_selector.dart';
import 'package:intl/intl.dart';
import 'data.dart';

class ScheduleInfo extends StatefulWidget {
  final UserGroup userGroup;

  ScheduleInfo({Key? key, required this.userGroup}) : super(key: key);

  @override
  _ScheduleInfoState createState() => _ScheduleInfoState();
}

class _ScheduleInfoState extends State<ScheduleInfo> {
  late UserGroup userGroup;
  List<bool> selectedDays = List.filled(7, true); // Mueve esto aquí
  final DateFormat _dateFormatter = DateFormat.yMd('es_ES');
  late String todayDate;
  late String toDate;
  String todayHour = DateFormat('HH:mm').format(DateTime.now());
  String toHour = DateFormat('HH:mm').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    userGroup = widget.userGroup;
    TimeOfDay currentTime = userGroup.schedule.toTime;
    toHour = '${currentTime.hour}:${currentTime.minute.toString().padLeft(2, '0')}';
    toDate = _dateFormatter.format(userGroup.schedule.toDate);
    todayDate = _dateFormatter.format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text('Schedule ' + userGroup.name),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text('From'),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(todayDate),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.calendar_month),
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year),
                      lastDate: DateTime(DateTime.now().year + 5),
                    );
                    if (pickedDate != null) {
                      // Actualiza la fecha con la fecha seleccionada
                      setState(() {
                        todayDate = _dateFormatter.format(pickedDate);
                      });
                    }
                  },
                ),
              ],
            ),
            Row(
              children: [
                Text('To'),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(toDate),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.calendar_month),
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year),
                      lastDate: DateTime(DateTime.now().year + 5),
                    );
                    if (pickedDate != null) {
                      // Actualiza la fecha con la fecha seleccionada
                      setState(() {
                        toDate = _dateFormatter.format(pickedDate);
                      });
                    }
                  },
                ),
              ],
            ),
            Column(
              children: [
                Text('WeekDays'),
                WeekdaySelector(
                  onChanged: (int day) {
                    setState(() {
                      selectedDays[day % 7] = !selectedDays[day % 7];
                    });
                  },
                  values: selectedDays,
                ),
              ],
            ),
            Row(
              children: [
                Text('From'),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(todayHour),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.access_time_outlined),
                  onPressed: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      // Actualiza la hora con la hora seleccionada
                      setState(() {
                        todayHour = '${pickedTime.hour}:${pickedTime.minute.toString().padLeft(2, '0')}';
                      });
                    }
                  },
                ),
              ],
            ),
            Row(
              children: [
                Text('To'),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(toHour),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.access_time_outlined),
                  onPressed: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      // Actualiza la hora con la hora seleccionada
                      setState(() {
                        toHour = '${pickedTime.hour}:${pickedTime.minute.toString().padLeft(2, '0')}';
                      });
                    }
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
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
    );
  }
}
