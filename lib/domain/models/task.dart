import 'package:taskly/domain/models/task_status.dart';
import 'package:taskly/domain/models/task_type.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Task {
  Task(
      {required this.id,
      required this.title,
      required this.description,
      required this.status,
      required this.type});

  String id;
  String title;
  String description;
  TaskStatus status;
  TaskType type;

  static String generateId() {
    return uuid.v4().toString();
  }
}
