import 'package:flutter/material.dart';
import 'package:flutter_kelompok/models/todo_models.dart';

class AwesomeCard extends StatelessWidget {
  final Lists list;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final ValueChanged<bool?>? onCheck;

  const AwesomeCard({
    super.key,
    required this.list,
    this.onTap,
    this.onDelete,
    this.onCheck,
  });

  Color urgencyColor(String urgency) {
    switch (urgency.toLowerCase()) {
      case "low":
        return Colors.green;
      case "normal":
        return Colors.blue;
      case "high":
        return Colors.orange;
      case "urgent":
        return Colors.red;
      default:
        return Colors.blueAccent;
    }
  }

  TextStyle dueDateStyle(String due) {
    try {
      // attempt string parse to date
      final dueDate = DateTime.parse(due);
      final today = DateTime.now();

      // day difference int
      final diff = dueDate
          .difference(DateTime(today.year, today.month, today.day))
          .inDays;

      // shmuck

      if (diff == 2) {
        // 2 days before due
        return const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        );
      } else if (diff == 1) {
        // 1 day before due
        return const TextStyle(
          fontSize: 12,
          color: Colors.orange,
          fontWeight: FontWeight.bold,
        );
      } else if (diff == 0) {
        // on due date
        return const TextStyle(
          fontSize: 12,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        );
        // past due
      } else if (diff < 1) {
        return TextStyle(
          fontSize: 12,
          color: Colors.grey[500],
          decoration: TextDecoration.lineThrough,
        );
        // default
      } else {
        return const TextStyle(fontSize: 12, color: Colors.black);
      }
    } catch (e) {
      // fallback if something goes funny
      return const TextStyle(fontSize: 12, color: Colors.black);
    }
  }

  // ya card
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      // inkwell basically makes the card responsive to tapping
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Checkbox(value: list.isClear, onChanged: onCheck),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      list.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      list.summary,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Chip(
                          label: Text(
                            "Urgency: ${list.urgency}",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor: urgencyColor(list.urgency),
                        ),
                        const SizedBox(width: 8),
                        Text("Due: ${list.due}", style: dueDateStyle(list.due)),
                      ],
                    ),
                  ],
                ),
              ),
              // enables/disables delete button depending on if its done or not
              list.isClear == false
                  ? IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: onDelete,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
