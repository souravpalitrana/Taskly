import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskly/domain/models/task_status.dart';

final taskStatusTypesProvider = Provider((ref) {
  return TaskStatus.values.toList();
});
