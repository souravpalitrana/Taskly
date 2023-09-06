import 'package:flutter/material.dart';
import 'package:taskly/domain/models/task.dart';

class TaskItem extends StatelessWidget {
  const TaskItem(this._task, {super.key});

  final Task _task;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            _task.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(_task.description,
              maxLines: 3,
              style: const TextStyle(
                fontSize: 16,
              )),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                _task.type.formmatedTaskType(),
              ),
              const Spacer(),
              Text(
                _task.status.formmatedTaskStatus(),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
