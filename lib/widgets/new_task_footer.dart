import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  final VoidCallback onPressed;
  const Footer({super.key, required this.onPressed});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
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
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              fixedSize: const Size(400, 50),
              textStyle: TextStyle(fontWeight: FontWeight.bold),
              backgroundColor: Color(0xFF6366F1),
            ),
            label: Text("Save Task"),
          ),

          SizedBox(height: 12),

          ElevatedButton.icon(
            onPressed: () async {
              Navigator.pop(context, "/");
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Color(0xFF6B7280),
              fixedSize: const Size(400, 50),
              backgroundColor: Color(0xFFE8EAF2),
              textStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
            label: Text("Cancel"),
          ),
        ],
      ),
    );
  }
}
