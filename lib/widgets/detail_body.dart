import 'package:flutter/material.dart';
import 'package:todo/services/task.dart';
import 'package:intl/intl.dart';

class DetailBody extends StatefulWidget {
  const DetailBody({super.key});

  @override
  State<DetailBody> createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    Task task = args['task'];
    DateTime date = task.createdAt;
    String formattedDate = DateFormat('MMMM d, yyyy').format(date);
    return Column(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: task.priority.color, width: 5.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 30.0, 45.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      task.taskName,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 22.0,
                        color: task.status ? Color(0xFF6B7280) : Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: task.status
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        decorationColor: task.status
                            ? Color(0xFF6B7280)
                            : Colors.black,
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: task.priority.color.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: task.priority.color,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              task.priority.label,
                              style: TextStyle(
                                color: task.priority.color,
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
            ),
          ),
        ),

        SizedBox(height: 10.0),

        Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 30.0, 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "DESCRIPTION",
                    style: TextStyle(fontSize: 16.0, color: Color(0xFF6B7284)),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    task.taskDescription,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),

        SizedBox(height: 10.0),

        Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 30.0, 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "INFO",
                    style: TextStyle(fontSize: 16.0, color: Color(0xFF6B7284)),
                  ),
                  SizedBox(height: 10.0),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Created",
                            style: TextStyle(color: Color(0xFF6B7280)),
                          ),
                          Text(
                            formattedDate,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Priority",
                            style: TextStyle(color: Color(0xFF6B7280)),
                          ),
                          Text(
                            task.priority.label,
                            style: TextStyle(
                              color: task.priority.color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Status",
                            style: TextStyle(color: Color(0xFF6B7280)),
                          ),
                          Text(
                            task.status ? "Completed" : "In process",
                            style: TextStyle(
                              color: task.status ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
