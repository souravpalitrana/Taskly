import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskly/domain/models/task.dart';
import 'package:taskly/domain/models/task_type.dart';
import 'package:taskly/domain/usecases/usecase_provider.dart';
import 'package:taskly/presentation/feature/home/provider/home_ui_state.dart';
import 'package:taskly/presentation/feature/task/provider/task_action_provider.dart';
import 'package:taskly/presentation/feature/task/provider/task_action_state.dart';

class HomeStateNotifier extends StateNotifier<HomeUIState> {
  HomeStateNotifier(this.ref) : super(NoTaskAvailableState()) {
    loadTaskByType(null, null);
    ref.listen(taskActionStateProvider, (previous, next) {
      if (next is TaskActionStateNone || next is TaskActionStateProcessing) {
        return;
      }
      final taskType = getTaskTypeFromTaskActionState(next);

      if (taskType != null) {
        selectedFilterIdx = getTaskIndexByName(taskType.name) + 1;
        loadTaskByType(taskType, next);
      }
    });
  }
  final Ref ref;
  int selectedFilterIdx = 0;

  void setFilter(int index) {
    selectedFilterIdx = index;
    loadTaskByType(_getTypeByIndex(index), null);
  }

  TaskType? _getTypeByIndex(int index) {
    final TaskType? type;
    if (index == 0) {
      type = null;
    } else if (index == 1) {
      type = TaskType.urgentImportant;
    } else if (index == 2) {
      type = TaskType.urgentNotImportant;
    } else if (index == 3) {
      type = TaskType.notUrgentImportant;
    } else {
      type = TaskType.notUrgentNotImportant;
    }
    return type;
  }

  Future<void> loadTaskByType(
      TaskType? taskType, TaskActionState? actionState) async {
    List<Task>? tasks;
    state = LoadingState();
    if (taskType == null) {
      final getAllTaskUsecase = ref.read(getAllTaskUseCaseProvider);
      tasks = await getAllTaskUsecase.execute();
    } else {
      final getAllTaskByUseCase = ref.read(getAllTaskByTypeUseCaseProvider);
      tasks = await getAllTaskByUseCase.execute(taskType);
    }

    if (tasks != null && tasks.isNotEmpty) {
      state = TaskAvailableState(tasks, taskActionState: actionState);
    } else {
      state = NoTaskAvailableState();
    }
  }

  Future<void> deleteTask(Task task) async {
    final deleteTaskUseCase = ref.read(deleteTaskUseCaseProvider);
    await deleteTaskUseCase.execute(task);
    loadTaskByType(
        _getTypeByIndex(selectedFilterIdx), TaskActionStateDeleted(task.type));
  }
}

final homeState = StateNotifierProvider<HomeStateNotifier, HomeUIState>(
    (ref) => HomeStateNotifier(ref));

final homeUIStateProvider = Provider((ref) => ref.watch(homeState));
