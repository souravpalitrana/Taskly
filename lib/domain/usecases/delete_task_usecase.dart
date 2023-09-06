import 'package:taskly/domain/entities/task.dart';

abstract class DeleteTaskUseCase {
  Future<bool> execute(Task task);
}
