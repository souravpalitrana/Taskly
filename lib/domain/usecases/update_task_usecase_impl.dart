import 'package:taskly/domain/models/task.dart';
import 'package:taskly/domain/repository/task_repository.dart';
import 'package:taskly/domain/usecases/update_task_usecase.dart';

class UpdateTaskUseCaseImpl extends UpdateTaskUseCase {
  UpdateTaskUseCaseImpl({required this.taskRepository});

  final TaskRepository taskRepository;

  @override
  Future<bool> execute(Task task) {
    return taskRepository.updateTask(task);
  }
}
