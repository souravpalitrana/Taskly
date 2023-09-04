import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskly/data/repository/repository_provider.dart';
import 'package:taskly/domain/usecases/add_task_usecase_impl.dart';
import 'package:taskly/domain/usecases/delete_task_usecase_impl.dart';
import 'package:taskly/domain/usecases/get_all_task_by_type_usecase_impl.dart';
import 'package:taskly/domain/usecases/get_all_task_usecase_impl.dart';
import 'package:taskly/domain/usecases/update_task_usecase_impl.dart';

final addTaskUseCaseProvider = Provider((ref) {
  final taskRepository = ref.read(taskRepositoryProvider);
  return AddTaskUseCaseImpl(taskRepository: taskRepository);
});

final getAllTaskUseCaseProvider = Provider((ref) {
  final taskRepository = ref.read(taskRepositoryProvider);
  return GetAllTaskUseCaseImpl(taskRepository: taskRepository);
});

final getAllTaskByTypeUseCaseProvider = Provider((ref) {
  final taskRepository = ref.read(taskRepositoryProvider);
  return GetAllTaskByTypeUseCaseImpl(taskRepository: taskRepository);
});

final deleteTaskUseCaseProvider = Provider((ref) {
  final taskRepository = ref.read(taskRepositoryProvider);
  return DeleteTaskUseCaseImpl(taskRepository: taskRepository);
});

final updateTaskeUseCaseProvider = Provider((ref) {
  final taskRepository = ref.read(taskRepositoryProvider);
  return UpdateTaskUseCaseImpl(taskRepository: taskRepository);
});
