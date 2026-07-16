import 'package:flutter/material.dart';

import 'package:todo/services/task.dart';

class NewTaskBody extends StatefulWidget {
  final TextEditingController taskNameController;
  final TextEditingController descriptionController;
  final Priority selectedPriority;
  final ValueChanged<Priority> onPriorityChanged;

  const NewTaskBody({
    super.key,
    required this.taskNameController,
    required this.descriptionController,
    required this.onPriorityChanged,
    required this.selectedPriority,
  });

  @override
  State<NewTaskBody> createState() => _NewTaskBodyState();
}

class _NewTaskBodyState extends State<NewTaskBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Text(
                      "TASK NAME",
                      style: TextStyle(
                        color: Color(0xFF5E616D),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "  *",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  maxLength: 20,
                  controller: widget.taskNameController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hint: Text(
                      "e.g. Review quarterly report",
                      style: TextStyle(color: Color(0xFFA7ACB3)),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),

              SizedBox(height: 30.0),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Text(
                      "DESCRIPTION",
                      style: TextStyle(
                        color: Color(0xFF5E616D),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "  (optional)",
                      style: TextStyle(color: Color(0xFF6B7280)),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: widget.descriptionController,
                  maxLength: 50,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hint: Text(
                      "Add more contect or notes",
                      style: TextStyle(color: Color(0xFFA7ACB3)),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),

              SizedBox(height: 30.0),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19.0),
                child: Text(
                  "PRIORITY LEVEL",
                  style: TextStyle(
                    color: Color(0xFF5E616D),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 23,
                  vertical: 10,
                ),
                child: DropdownButtonFormField<Priority>(
                  initialValue: widget.selectedPriority,

                  onChanged: (value) {
                    if (value == null) return;

                    widget.onPriorityChanged(value);
                  },

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),

                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 16,
                    ),
                  ),

                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: Priority.values.map((priority) {
                    return DropdownMenuItem<Priority>(
                      value: priority,
                      child: Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: priority.color,
                              shape: BoxShape.circle,
                            ),
                          ),

                          const SizedBox(width: 12),

                          Text(
                            priority.label,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  }).toList(),

                  selectedItemBuilder: (context) {
                    return Priority.values.map((priority) {
                      return Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: priority.color,
                              shape: BoxShape.circle,
                            ),
                          ),

                          const SizedBox(width: 12),

                          Text(priority.label),
                        ],
                      );
                    }).toList();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
