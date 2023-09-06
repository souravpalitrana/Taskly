import 'package:taskly/domain/entities/task.dart';

abstract class UseCase<T> {
  Task? task;

  void setParam(Task task) {}

  Future<bool> execute(Task task);
}
