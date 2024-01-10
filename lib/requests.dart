import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert' as convert;
import 'tree.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Utils {
  static final DateFormat _dateFormatter = DateFormat("yyyy-MM-dd");
  static final DateFormat _timeFormatter = DateFormat("HH:mm");

  static String formattedDate(date) {
    return _dateFormatter.format(date);
  }

  static String formattedTime(time) {
    return  _timeFormatter.format(
        DateTime(1, 1, 1, time.hour, time.minute));
  }

  static String formattedDateTime(date, time) {
    return "${formattedDate(date)}T${formattedTime(time)}";
  }
}

void main() {
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  print(Utils.formattedDateTime(date, time));
}

Future<Tree> getTree(String areaId) async {
  const String BASE_URL = "http://localhost:8080";
  Uri uri = Uri.parse("${BASE_URL}/get_children?$areaId");
  final response = await http.get(uri);
  // response is NOT a Future because of await
  if (response.statusCode == 200) {
    // TODO: change prints by logs, use package Logger for instance
    // which is the most popular, see https://pub.dev/packages/logger
    print("statusCode=$response.statusCode");
    print(response.body);
    // If the server did return a 200 OK response, then parse the JSON.
    Map<String, dynamic> decoded = convert.jsonDecode(response.body);
    return Tree(decoded);
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    print("statusCode=$response.statusCode");
    throw Exception('failed to get answer to request $uri');
  }
}
Future<void> updateDoorState(String doorId, String action) async {
  // Reemplaza esta URL con la URL de tu servidor
  const String BASE_URL = "http://localhost:8080";
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  String now = Utils.formattedDateTime(date, time);

  Uri uri = Uri.parse("${BASE_URL}/reader?credential=11343&action=$action&datetime=$now&doorId=$doorId");
  final response = await http.get(uri);

  if (response.statusCode != 200) {
    throw Exception('Failed to update door state');
  }
}
