import 'package:taskly/domain/entities/task.dart';

abstract class UpdateTaskUseCase {
  Future<bool> execute(Task task);
}
