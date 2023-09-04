import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskly/data/datasource/task_data_source_impl.dart';

final dataSourceProvider = Provider((ref) {
  return TaskDataSourceAsDatabase();
});
