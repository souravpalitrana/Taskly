import 'package:taskly/domain/entities/task.dart';

abstract class AddTaskUseCase {
  Future<bool> execute(Task task);
}
