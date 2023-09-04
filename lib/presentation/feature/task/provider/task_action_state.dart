import 'package:taskly/domain/models/task_type.dart';

sealed class TaskActionState {}

class TaskActionStateNone extends TaskActionState {}

class TaskActionStateProcessing extends TaskActionState {}

class TaskActionStateAdded extends TaskActionState {
  TaskActionStateAdded(this.taskType);
  TaskType taskType;
}

class TaskActionStateDeleted extends TaskActionState {
  TaskActionStateDeleted(this.taskType);
  TaskType taskType;
}

class TaskActionStateUpdated extends TaskActionState {
  TaskActionStateUpdated(this.taskType);
  TaskType taskType;
}

TaskType? getTaskTypeFromTaskActionState(TaskActionState? taskActionState) {
  switch (taskActionState) {
    case TaskActionStateAdded():
      return taskActionState.taskType;
    case TaskActionStateUpdated():
      return taskActionState.taskType;
    case TaskActionStateDeleted():
      return taskActionState.taskType;
    default:
      return null;
  }
}
