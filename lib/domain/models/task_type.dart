enum TaskType {
  urgentImportant("Urgent Important"),
  urgentNotImportant("Urgent Not Important"),
  notUrgentImportant("Not Urgent Important"),
  notUrgentNotImportant("Not Urgent Not Important");

  const TaskType(this._text);

  final String _text;

  String formmatedTaskType() => _text;
}

TaskType getTaskTypeByName(String name) {
  if (name == TaskType.urgentImportant.name) {
    return TaskType.urgentImportant;
  } else if (name == TaskType.urgentNotImportant.name) {
    return TaskType.urgentNotImportant;
  } else if (name == TaskType.notUrgentImportant.name) {
    return TaskType.notUrgentImportant;
  } else {
    return TaskType.notUrgentNotImportant;
  }
}

int getTaskIndexByName(String name) {
  if (name == TaskType.urgentImportant.name) {
    return 0;
  } else if (name == TaskType.urgentNotImportant.name) {
    return 1;
  } else if (name == TaskType.notUrgentImportant.name) {
    return 2;
  } else {
    return 3;
  }
}
