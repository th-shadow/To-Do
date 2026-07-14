import 'package:flutter/material.dart';
import 'package:todo/services/task.dart';

class HomeTabs extends StatefulWidget {
  final int tabIndex;
  final ValueChanged<int> onTabChanged;
  const HomeTabs({
    super.key,
    required this.tabIndex,
    required this.onTabChanged,
  });

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  Widget buildTab(String title, int index) {
    final Tasks tasksInstance = Tasks(tasks: tasksList);
    int numberOfTasks;
    final (all, active, completed) = tasksInstance.getInfo();

    if (index == 0) {
      numberOfTasks = all;
    } else if (index == 1) {
      numberOfTasks = active;
    } else if (index == 2) {
      numberOfTasks = completed;
    } else {
      numberOfTasks = 0;
    }

    title += " (${numberOfTasks.toString()})";

    return Expanded(
      child: GestureDetector(
        onTap: () {
          widget.onTabChanged(index);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          alignment: AlignmentGeometry.center,
          decoration: BoxDecoration(
            color: widget.tabIndex == index
                ? Colors.white
                : const Color.fromRGBO(232, 234, 242, 1),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.0,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(232, 234, 242, 1),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (final (index, title) in ["All", "Active", "Done"].indexed)
              buildTab(title, index),
          ],
        ),
      ),
    );
  }
}
