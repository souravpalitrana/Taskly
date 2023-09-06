import 'package:taskly/domain/entities/task.dart';
import 'package:taskly/domain/entities/task_type.dart';

abstract class GetAllTaskByTypeUseCase {
  Future<List<Task>?> execute(TaskType type);
}
