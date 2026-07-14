import 'package:flutter/material.dart';
import 'package:todo/services/task.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    final Tasks tasksInstance = Tasks(tasks: tasksList);
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    Task task = args['task'];
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xFFF2F4F8),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            color: Colors.grey, // Line color
            thickness: 0.5, // Line thickness
          ),

          ElevatedButton.icon(
            onPressed: () {
              tasksInstance.changeStatus(task.id);

              if (!mounted) return;
              Navigator.pop(context, true);
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: task.status ? Color(0xFF6B7280) : Colors.white,
              fixedSize: const Size(400, 50),
              iconColor: task.status ? Color(0xFF6B7280) : Colors.white,
              textStyle: TextStyle(fontWeight: FontWeight.bold),
              backgroundColor: task.status
                  ? Color(0xFFE8EAF2)
                  : Color(0xFF00BC7D),
            ),
            icon: Icon(Icons.done, fontWeight: FontWeight.bold),
            label: task.status
                ? Text("Mark as Done")
                : Text("Mark as Incomplete"),
          ),

          SizedBox(height: 12),

          ElevatedButton.icon(
            onPressed: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text("Delete task?"),
                  content: const Text("This action cannot be undone."),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text("Cancel"),
                    ),
                    FilledButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text("Delete"),
                    ),
                  ],
                ),
              );

              if (confirmed == true) {
                tasksInstance.deleteTask(task.id);

                if (!mounted) return;

                // ignore: use_build_context_synchronously
                Navigator.pop(context, true);
              }
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.red,
              fixedSize: const Size(400, 50),
              iconColor: Colors.red,
              backgroundColor: Color(0xFFFEF2F2),
              textStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
            icon: Icon(Icons.delete, fontWeight: FontWeight.bold),
            label: Text("Delete Task"),
          ),
        ],
      ),
    );
  }
}
