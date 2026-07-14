import 'package:flutter/material.dart';
import 'package:todo/models/home.dart';
import 'package:todo/models/detail.dart';
import 'package:todo/models/new_task.dart';

void main() {
  runApp(
    MaterialApp(
      // home: Home(),
      initialRoute: "/",
      routes: {
        "/": (context) => Home(),
        "/detail": (context) => TaskDetail(),
        "/new_task": (context) => NewTask(),
      },
    ),
  );
}
