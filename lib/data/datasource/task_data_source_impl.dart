import 'package:sqflite/sqlite_api.dart';
import 'package:taskly/data/datasource/sql_constants.dart';
import 'package:taskly/data/datasource/task_data_source.dart';
import 'package:taskly/domain/models/task.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:taskly/domain/models/task_type.dart';
import 'package:taskly/data/datasource/transformer.dart';

class TaskDataSourceAsDatabase extends TaskDataSource {
  Future<Database> _getDatabase() async {
    final dbPath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(
      path.join(dbPath, 'taskly.db'),
      onCreate: (db, version) {
        return db.execute(createTableQuery);
      },
      version: 1,
    );
    return db;
  }

  @override
  Future<bool> addTask(Task task) async {
    final db = await _getDatabase();
    db.insert(tableName, {
      'id': task.id,
      'title': task.title,
      'description': task.description,
      'type': task.type.name,
      'status': task.status.name
    });
    return true;
  }

  @override
  Future<bool> deleteTask(Task task) async {
    deleteTaskById(task.id);
    return true;
  }

  @override
  Future<bool> deleteTaskById(String id) async {
    final db = await _getDatabase();
    db.rawQuery("DELETE FROM $tableName WHERE id = '$id'");
    return true;
  }

  @override
  Future<List<Task>?> getAllTask() async {
    final db = await _getDatabase();
    var allTask = await db.rawQuery('SELECT * from $tableName');

    if (allTask.isEmpty) {
      return [];
    }
    return tansformToTaskList(allTask);
  }

  @override
  Future<bool> updateTask(Task task) async {
    final db = await _getDatabase();
    await db.update(
        tableName,
        {
          'title': task.title,
          'description': task.description,
          'type': task.type.name,
          'status': task.status.name
        },
        where: 'id = ?',
        whereArgs: [task.id]);
    return true;
  }

  @override
  Future<List<Task>> getAllTaskByType(TaskType taskType) async {
    final db = await _getDatabase();
    var allTask = await db
        .rawQuery("SELECT * from $tableName WHERE type = '${taskType.name}'");
    if (allTask.isEmpty) {
      return [];
    }
    return tansformToTaskList(allTask);
  }
}
