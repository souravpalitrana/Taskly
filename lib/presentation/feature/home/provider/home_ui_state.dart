import 'package:taskly/domain/models/task.dart';
import 'package:taskly/presentation/feature/task/provider/task_action_state.dart';

sealed class HomeUIState {}

class LoadingState extends HomeUIState {}

class NoTaskAvailableState extends HomeUIState {}

class TaskAvailableState extends HomeUIState {
  TaskAvailableState(this.taskList, {this.taskActionState});
  List<Task> taskList;
  TaskActionState? taskActionState;
}
