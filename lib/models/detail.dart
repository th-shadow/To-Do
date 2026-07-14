import 'package:flutter/material.dart';
import 'package:todo/widgets/detail_header.dart';
import 'package:todo/widgets/detail_body.dart';
import 'package:todo/widgets/detail_footer.dart';

class TaskDetail extends StatefulWidget {
  const TaskDetail({super.key});

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
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
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(9.0),
          child: Column(children: [DetailHeader(), DetailBody()]),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
