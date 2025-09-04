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

  // ya card
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      // inkwell basically makes the card responsive to tapping
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Checkbox(
                value: list.isClear,
                onChanged: onCheck,
              ),
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
                        decoration:
                            list.isClear ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      list.summary,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        decoration:
                            list.isClear ? TextDecoration.lineThrough : null,
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
                          backgroundColor: Colors.blueAccent,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Due: ${list.due}",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.redAccent[200],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              // enables/disables delete button depending on if its done or not
              list.isClear == false ?IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: onDelete,
              ) : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
