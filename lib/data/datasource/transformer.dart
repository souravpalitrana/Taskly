import 'package:taskly/domain/entities/task.dart';
import 'package:taskly/domain/entities/task_status.dart';
import 'package:taskly/domain/entities/task_type.dart';

List<Task> tansformToTaskList(List<Map<String, Object?>> data) {
  return data.map((t) {
    return Task(
      id: t['id'] as String,
      title: t['title'] as String,
      description: t['description'] as String,
      status: getTaskStatusByName(t['status'] as String),
      type: getTaskTypeByName(t['type'] as String),
    );
  }).toList();
}
