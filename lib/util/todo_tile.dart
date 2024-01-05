import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  
  
  TodoTile({super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Row(
          children: [
            //checkbox
            Checkbox(value: taskCompleted, onChanged: onChanged),

            //task name
            Text(taskName),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.yellow[500],
          borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}