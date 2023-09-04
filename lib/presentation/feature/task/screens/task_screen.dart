import 'package:flutter/material.dart';
import 'package:taskly/domain/models/task.dart';
import 'package:taskly/presentation/feature/task/widgets/task_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskScreen extends ConsumerStatefulWidget {
  const TaskScreen({this.task, super.key});

  final Task? task;

  @override
  ConsumerState<TaskScreen> createState() {
    return _TaskScreen();
  }
}

class _TaskScreen extends ConsumerState<TaskScreen> {
  bool get _isTaskEditing => widget.task != null;

  @override
  Widget build(BuildContext context) {
    TaskFormWidget taskFormWidget = TaskFormWidget(task: widget.task);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            _isTaskEditing ? 'Edit Task' : 'Add Task',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            taskFormWidget.saveTask();
          },
          child: Icon(_isTaskEditing ? Icons.edit : Icons.save),
        ),
        body: taskFormWidget);
  }
}
