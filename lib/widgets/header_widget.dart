import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Tasks",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "4 tasks remaining",
              style: TextStyle(fontSize: 17.0, color: Colors.grey.shade800),
            ),
          ],
        ),
        // Icon(Icons.task, color: Colors.indigoAccent, size: 45.0),
        Center(
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/to-do-list.png"),
            backgroundColor: Colors.indigoAccent,
            radius: 25.0,
          ),
        ),
      ],
    );
  }
}
