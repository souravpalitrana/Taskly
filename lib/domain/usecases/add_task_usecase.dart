import 'package:taskly/domain/models/task.dart';

abstract class AddTaskUseCase {
  Future<bool> execute(Task task);
}
