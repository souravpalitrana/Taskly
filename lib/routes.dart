import 'package:flutter/material.dart';
import 'package:taskly/domain/models/task.dart';
import 'package:taskly/presentation/feature/home/screens/home_screen.dart';
import 'package:taskly/presentation/feature/task/screens/task_screen.dart';

void navigateToHome(BuildContext context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
    return const HomeScreen();
  }));
}

Future<Task?> navigateToAddTask(BuildContext context) {
  final route =
      Navigator.of(context).push<Task?>(MaterialPageRoute(builder: (ctx) {
    return const TaskScreen();
  }));
  return route;
}

Future<Task?> navigateToEditTask(BuildContext context, Task task) {
  final route =
      Navigator.of(context).push<Task?>(MaterialPageRoute(builder: (ctx) {
    return TaskScreen(task: task);
  }));
  return route;
}

void navigateBackToHome(BuildContext context) {
  Navigator.of(context).pop();
}
