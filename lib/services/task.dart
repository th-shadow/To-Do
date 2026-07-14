import 'package:flutter/material.dart';

enum Priority {
  minimal,
  low,
  medium,
  high,
  critical;

  String get label => switch (this) {
    Priority.minimal => "Minimal",
    Priority.low => "Low",
    Priority.medium => "Medium",
    Priority.high => "High",
    Priority.critical => "Critical",
  };

  Color get color => switch (this) {
    Priority.minimal => Colors.green,
    Priority.low => Colors.blue,
    Priority.medium => Colors.yellow,
    Priority.high => Colors.orange,
    Priority.critical => Colors.red,
  };
}

class Task {
  int id;
  String taskName;
  String taskDescription;
  Priority priority;

  bool status = false;
  DateTime createdAt = DateTime.now();

  Task({
    required this.id,
    required this.taskName,
    required this.taskDescription,
    required this.priority,
    required this.status,
  });
}

class Tasks {
  List<Task> tasks = [];

  Tasks({required this.tasks});

  (int all, int active, int completed) getInfo() {
    return (
      tasksList.length,
      tasksList.where((task) => task.status == false).length,
      tasks.length - tasksList.where((task) => task.status == false).length,
    );
  }

  void changeStatus(int id) {
    final task = tasks.firstWhere((task) => task.id == id);
    task.status = !task.status;
  }

  List<Task> getAllTasks() {
    return tasks.reversed.toList();
  }

  List<Task> getActiveTasks() {
    return tasks.where((task) => !task.status).toList().reversed.toList();
  }

  List<Task> getCompleteTasks() {
    return tasks.where((task) => task.status).toList().reversed.toList();
  }

  void addTask(String taskName, String taskDescription, Priority priority) {
    if (taskName.isEmpty) throw Error();
    if (taskDescription.isEmpty) taskDescription = "";

    int id = tasksList.last.id + 1;
    Task newTask = Task(
      id: id,
      taskName: taskName,
      taskDescription: taskDescription,
      priority: priority,
      status: false,
    );
    tasksList.add(newTask);
  }

  void deleteTask(int taskID) {
    Task taskToDelete = tasksList.where((task) => task.id == taskID).first;
    tasksList.remove(taskToDelete);
  }
}

List<Task> tasksList = [
  Task(
    id: 1,
    taskName: 'Pay taxes (eventually)',
    taskDescription: "If you don't, they will come to your door",
    priority: Priority.minimal,
    status: false,
  ),
  Task(
    id: 2,
    taskName: 'Remember why you opened the fridge',
    taskDescription: "it is important though, right?",
    priority: Priority.critical,
    status: true,
  ),
  Task(
    id: 3,
    taskName: 'Touch grass',
    taskDescription: 'print("if no_coding: has_meaning = False")',
    priority: Priority.low,
    status: false,
  ),
  Task(
    id: 4,
    taskName: 'Convince compiler that the bug is a feature',
    taskDescription: "oh yeah ;)",
    priority: Priority.high,
    status: true,
  ),
  Task(
    id: 5,
    taskName: 'Annoy someone',
    taskDescription: "your friend",
    priority: Priority.medium,
    status: false,
  ),
];
