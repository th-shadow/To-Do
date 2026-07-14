import 'package:flutter/material.dart';
import 'package:todo/widgets/new_task_footer.dart';
import 'package:todo/widgets/new_task_body.dart';
import 'package:todo/services/task.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final taskNameController = TextEditingController();
  final descriptionController = TextEditingController();

  Priority selectedPriority = Priority.medium;

  void addTask() {
    final Tasks tasksInstance = Tasks(tasks: tasksList);
    tasksInstance.addTask(
      taskNameController.text,
      descriptionController.text,
      selectedPriority,
    );
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F4F8),
      appBar: AppBar(
        backgroundColor: Color(0xFFF2F4F8),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black12,
            ),
            child: IconButton(
              style: IconButton.styleFrom(backgroundColor: Colors.white),
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.arrow_back, size: 18),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("New Task", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Fill in the details below", style: TextStyle(fontSize: 14.0)),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            NewTaskBody(
              taskNameController: taskNameController,
              descriptionController: descriptionController,
              selectedPriority: selectedPriority,
              onPriorityChanged: (priority) {
                setState(() {
                  selectedPriority = priority;
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(onPressed: addTask),
    );
  }
}
