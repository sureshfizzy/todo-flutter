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
      padding: EdgeInsets.only(left: 25.0, top: 25.0),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.yellow[500],
          borderRadius: BorderRadius.circular(14)),
        child: Row(
          children: [
            //checkbox
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              activeColor: Colors.black,
              ),

            //task name
            Text(
              taskName,
              style: TextStyle(
                decoration: taskCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
                ),
              ),
          ],
        ),
      ),
    );
  }
}