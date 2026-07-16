import 'package:flutter/material.dart';
import 'package:todo/services/task.dart';
import 'package:todo/extensions/string_extensions.dart';

class Cards extends StatefulWidget {
  final int tabIndex;
  final VoidCallback onChanged;
  const Cards({super.key, required this.tabIndex, required this.onChanged});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    final Tasks tasksInstance = Tasks(tasks: tasksList);

    List<Task> tasks;

    if (widget.tabIndex == 0) {
      tasks = tasksInstance.getAllTasks();
    } else if (widget.tabIndex == 1) {
      tasks = tasksInstance.getActiveTasks();
    } else if (widget.tabIndex == 2) {
      tasks = tasksInstance.getCompleteTasks();
    } else {
      tasks = [];
    }

    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: tasks[index].priority.color,
                    width: 5.0,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tasks[index].taskName.capitalize(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: tasks[index].status
                                      ? Colors.grey.shade700
                                      : Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  decoration: tasks[index].status
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  decorationThickness: 2,
                                  decorationColor: Colors.grey.shade700,
                                ),
                              ),
                              Text(
                                tasks[index].taskDescription,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: tasks[index].priority.color.withValues(
                                  alpha: 0.15,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 6,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      color: tasks[index].priority.color,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    tasks[index].priority.label,
                                    style: TextStyle(
                                      color: tasks[index].priority.color,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 4.0),
                    Divider(
                      color: Colors.grey, // Line color
                      thickness: 0.5, // Line thickness
                    ),

                    // Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton.icon(
                          onPressed: () async {
                            final isChanged = await Navigator.pushNamed(
                              context,
                              "/detail",
                              arguments: {"task": tasks[index]},
                            );

                            if (isChanged == true) {
                              widget.onChanged();
                            }
                          },
                          icon: Icon(Icons.remove_red_eye_outlined),
                          label: Text("View"),
                          style: ButtonStyle(
                            foregroundColor: WidgetStateProperty.all(
                              Colors.grey.shade600,
                            ),
                            overlayColor: WidgetStateProperty.resolveWith((
                              states,
                            ) {
                              if (states.contains(WidgetState.pressed)) {
                                return Colors.grey.shade600.withValues(
                                  alpha: 0.2,
                                );
                              }

                              if (states.contains(WidgetState.hovered)) {
                                return Colors.grey.shade600.withValues(
                                  alpha: 0.1,
                                );
                              }

                              return Colors.transparent;
                            }),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            tasksInstance.changeStatus(tasks[index].id);

                            setState(() {});
                          },
                          icon: Icon(Icons.check_box_outlined),
                          label: tasks[index].status
                              ? Text("Undo")
                              : Text("Done"),
                          style: ButtonStyle(
                            foregroundColor: WidgetStateProperty.all(
                              tasks[index].status
                                  ? Colors.grey.shade600
                                  : Colors.greenAccent,
                            ),
                            overlayColor: WidgetStateProperty.resolveWith((
                              states,
                            ) {
                              if (states.contains(WidgetState.pressed)) {
                                return tasks[index].status
                                    ? Colors.grey.shade600.withValues(
                                        alpha: 0.2,
                                      )
                                    : Colors.greenAccent.withValues(alpha: 0.2);
                              }

                              if (states.contains(WidgetState.hovered)) {
                                return tasks[index].status
                                    ? Colors.grey.shade600
                                    : Colors.greenAccent.withValues(alpha: 0.1);
                              }

                              return Colors.transparent;
                            }),
                          ),
                        ),

                        TextButton.icon(
                          onPressed: () async {
                            final confirmed = await showDialog<bool>(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Text("Delete task?"),
                                content: const Text(
                                  "This action cannot be undone.",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, false),
                                    child: const Text("Cancel"),
                                  ),
                                  FilledButton(
                                    onPressed: () =>
                                        Navigator.pop(context, true),
                                    child: const Text("Delete"),
                                  ),
                                ],
                              ),
                            );

                            if (confirmed == true) {
                              tasksInstance.deleteTask(tasks[index].id);

                              widget.onChanged();
                            }
                          },
                          icon: Icon(Icons.delete),
                          label: const Text("Delete"),
                          style: ButtonStyle(
                            foregroundColor: WidgetStateProperty.all(
                              Colors.red,
                            ),
                            overlayColor: WidgetStateProperty.resolveWith((
                              states,
                            ) {
                              if (states.contains(WidgetState.pressed)) {
                                return Colors.red.withValues(alpha: 0.2);
                              }

                              if (states.contains(WidgetState.hovered)) {
                                return Colors.red.withValues(alpha: 0.1);
                              }

                              return Colors.transparent;
                            }),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
