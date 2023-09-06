import 'package:taskly/domain/models/task.dart';
import 'package:taskly/domain/repository/task_repository.dart';
import 'package:taskly/domain/usecases/delete_task_usecase.dart';

class DeleteTaskUseCaseImpl extends DeleteTaskUseCase {
  DeleteTaskUseCaseImpl({required this.taskRepository});

  final TaskRepository taskRepository;

  @override
  Future<bool> execute(Task task) {
    return taskRepository.deleteTask(task);
  }
}
