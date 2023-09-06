import 'package:taskly/domain/models/task.dart';
import 'package:taskly/domain/models/task_type.dart';

abstract class TaskDataSource {
  Future<bool> addTask(Task task);
  Future<bool> deleteTask(Task task);
  Future<bool> deleteTaskById(String id);
  Future<List<Task>?> getAllTask();
  Future<bool> updateTask(Task task);
  Future<List<Task>?> getAllTaskByType(TaskType taskType);
}
