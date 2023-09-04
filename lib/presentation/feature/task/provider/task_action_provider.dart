import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskly/domain/models/task.dart';
import 'package:taskly/domain/usecases/usecase_provider.dart';
import 'package:taskly/presentation/feature/task/provider/task_action_state.dart';

class TaskActionStateNotifier extends StateNotifier<TaskActionState> {
  TaskActionStateNotifier(this.ref) : super(TaskActionStateNone());
  final Ref ref;

  Future<void> addTask(Task task) async {
    final useCase = ref.read(addTaskUseCaseProvider);
    state = TaskActionStateProcessing();
    await useCase.execute(task);
    state = TaskActionStateAdded(task.type);
  }

  Future<void> updateTask(Task task) async {
    final useCase = ref.read(updateTaskeUseCaseProvider);
    state = TaskActionStateProcessing();
    await useCase.execute(task);
    state = TaskActionStateUpdated(task.type);
  }

  Future<void> deleteTask(Task task) async {
    final useCase = ref.read(deleteTaskUseCaseProvider);
    state = TaskActionStateProcessing();
    await useCase.execute(task);
    state = TaskActionStateDeleted(task.type);
  }
}

final taskActionStateNotifierProvider =
    StateNotifierProvider<TaskActionStateNotifier, TaskActionState>(
        (ref) => TaskActionStateNotifier(ref));

final taskActionStateProvider =
    Provider((ref) => ref.watch(taskActionStateNotifierProvider));
