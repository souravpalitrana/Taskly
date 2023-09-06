enum TaskStatus {
  completed("Completed"),
  incompleted("Incompleted"),
  ongoing("Ongoing");

  const TaskStatus(this._text);

  final String _text;

  String formmatedTaskStatus() => _text;
}

TaskStatus getTaskStatusByName(String name) {
  if (name == TaskStatus.completed.name) {
    return TaskStatus.completed;
  } else if (name == TaskStatus.incompleted.name) {
    return TaskStatus.incompleted;
  } else {
    return TaskStatus.ongoing;
  }
}
