import 'package:taskly/domain/entities/task.dart';

abstract class GetAllTaskUseCase {
  Future<List<Task>?> execute();
}
