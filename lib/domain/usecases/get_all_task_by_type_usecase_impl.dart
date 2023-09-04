import 'package:taskly/domain/models/task.dart';
import 'package:taskly/domain/models/task_type.dart';
import 'package:taskly/domain/repository/task_repository.dart';
import 'package:taskly/domain/usecases/get_all_task_by_type_usecase.dart';

class GetAllTaskByTypeUseCaseImpl extends GetAllTaskByTypeUseCase {
  GetAllTaskByTypeUseCaseImpl({required this.taskRepository});

  final TaskRepository taskRepository;

  @override
  Future<List<Task>?> execute(TaskType taskType) {
    return taskRepository.getAllTaskByType(taskType);
  }
}
