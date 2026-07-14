import 'package:flutter/material.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Task Detail",
      style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
    );
  }
}
