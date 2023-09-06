import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskly/domain/entities/task_status.dart';

final taskStatusTypesProvider = Provider((ref) {
  return TaskStatus.values.toList();
});
