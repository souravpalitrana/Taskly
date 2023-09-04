import 'package:taskly/domain/models/task.dart';
import 'package:taskly/domain/repository/task_repository.dart';
import 'package:taskly/domain/usecases/add_task_usecase.dart';

class AddTaskUseCaseImpl extends AddTaskUseCase {
  AddTaskUseCaseImpl({required this.taskRepository});

  final TaskRepository taskRepository;

  @override
  Future<bool> execute(Task task) {
    return taskRepository.addTask(task);
  }
}
