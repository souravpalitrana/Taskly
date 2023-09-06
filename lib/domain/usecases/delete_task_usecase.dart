import 'package:taskly/domain/models/task.dart';

abstract class DeleteTaskUseCase {
  Future<bool> execute(Task task);
}
