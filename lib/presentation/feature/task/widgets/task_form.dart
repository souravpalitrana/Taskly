import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskly/domain/models/task.dart';
import 'package:taskly/domain/models/task_status.dart';
import 'package:taskly/domain/models/task_type.dart';
import 'package:taskly/presentation/feature/task/provider/task_action_provider.dart';
import 'package:taskly/presentation/providers/task_status_types_provider.dart';
import 'package:taskly/presentation/providers/task_types_provider.dart';
import 'package:taskly/routes.dart';

class TaskFormWidget extends ConsumerStatefulWidget {
  TaskFormWidget({this.task, super.key});

  final Task? task;
  late void Function() saveTask;

  @override
  ConsumerState<TaskFormWidget> createState() {
    return _AddTaskFormWidgetState();
  }
}

class _AddTaskFormWidgetState extends ConsumerState<TaskFormWidget> {
  late List<TaskType> _taskTypes;
  late List<TaskStatus> _taskStatusTypes;
  final _formKey = GlobalKey<FormState>();
  var _enteredTitle = '';
  var _enteredDescription = '';
  var _selectedTaskType = '';
  var _selectedTaskStatus = '';
  bool get _isTaskEditing => widget.task != null;
  late TaskActionStateNotifier taskActionProvider;
  @override
  void initState() {
    super.initState();
    taskActionProvider = ref.read(taskActionStateNotifierProvider.notifier);
    widget.saveTask = () => saveTask();
    _taskTypes = ref.read(taskTypesProvider);
    _taskStatusTypes = ref.read(taskStatusTypesProvider);
    if (_isTaskEditing) {
      _selectedTaskType = widget.task!.type.name;
      _selectedTaskStatus = widget.task!.status.name;
    }
  }

  void saveTask() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final task = Task(
        id: _isTaskEditing ? widget.task!.id : Task.generateId(),
        title: _enteredTitle,
        description: _enteredDescription,
        status: getTaskStatusByName(_selectedTaskStatus),
        type: getTaskTypeByName(_selectedTaskType),
      );
      widget.task == null ? _addNewTask(task) : _updateTask(task);
    }
  }

  void _addNewTask(Task task) async {
    await taskActionProvider.addTask(task);
    if (mounted) {
      navigateBackToHome(context);
    }
  }

  void _updateTask(Task task) async {
    await taskActionProvider.updateTask(task);
    if (mounted) {
      navigateBackToHome(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final task = widget.task;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: task?.title,
                keyboardType: TextInputType.text,
                maxLength: 100,
                decoration:
                    const InputDecoration(label: Text('Enter task title')),
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty ||
                      value.trim().length < 5) {
                    return 'Enter a task title and min character is 5';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredTitle = value!;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.text,
                initialValue: task?.description,
                maxLength: 500,
                decoration: const InputDecoration(
                    label: Text('Enter task description')),
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty ||
                      value.trim().length < 10) {
                    return 'Enter a task description and min character is 10';
                  }
                  return null;
                },
                onSaved: (value) => _enteredDescription = value!,
              ),
              DropdownButtonFormField(
                hint: const Text('Select Task Type'),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a task type';
                  }
                  return null;
                },
                value: _isTaskEditing ? _selectedTaskType : null,
                items: [
                  for (TaskType taskType in _taskTypes)
                    DropdownMenuItem(
                      value: taskType.name,
                      child: Text(taskType.formmatedTaskType()),
                    )
                ],
                onChanged: (item) {
                  setState(() {
                    _selectedTaskType = item!;
                  });
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField(
                hint: const Text('Select Task Status'),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a task status';
                  }
                  return null;
                },
                value: _isTaskEditing ? _selectedTaskStatus : null,
                items: [
                  for (TaskStatus taskStatus in _taskStatusTypes)
                    DropdownMenuItem(
                      value: taskStatus.name,
                      child: Text(taskStatus.formmatedTaskStatus()),
                    )
                ],
                onChanged: (item) {
                  setState(() {
                    _selectedTaskStatus = item!;
                  });
                },
              )
            ],
          )),
    );
  }
}
