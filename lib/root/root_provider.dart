import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_scheduler_example/create_task/create_task_provider.dart';
import 'package:flutter_scheduler_example/home/home_provider.dart';
import 'package:flutter_scheduler_example/models/task.dart';
import 'package:flutter_scheduler_example/tasks/tasks_provider.dart';

class RootProvider {
  final taskFilterProvider =
      StateNotifierProvider<TaskFilterNotify, TaskListFilter>((ref) {
    return TaskFilterNotify(
      TaskListFilter.all,
    );
  });

  final taskProvider = StateNotifierProvider<CreateTaskProvider, Task>((ref) {
    return CreateTaskProvider(
      Task(
        id: Random.secure().nextInt(200),
        hours: 1,
        title: '',
        description: '',
        status: 'My Tasks',
        category: 'Design',
        date: DateTime.now(),
      ),
    );
  });

  final taskDateProvider =
      StateNotifierProvider<TaskDateProvider, DateTime>((ref) {
    return TaskDateProvider(
      DateTime.now(),
    );
  });

  final newtaskProvider =
      StateNotifierProvider<CreateTaskProvider, Task>((ref) {
    return CreateTaskProvider(
      Task(
        id: 4,
        hours: 1,
        date: DateTime.now(),
        title: '',
        description: '',
        status: 'My Tasks',
        category: '',
      ),
    );
  });

  final taskListProvider = StateNotifierProvider<TaskList, List<Task>>(
    (ref) {
      final date = DateTime.now();
      final cDate = DateTime(
        date.year,
        date.month,
        date.day,
      );
      return TaskList(
        [
          Task(
            id: 1,
            title: 'Design',
            description: 'Design Task',
            status: 'Complete',
            date: cDate,
            hours: 1,
            category: '',
          ),
          Task(
            id: 2,
            title: 'Coding',
            description: 'Coding Task',
            status: 'In Progress',
            date: cDate,
            hours: 1,
            category: '',
          ),
          Task(
            id: 3,
            title: 'Refactoring',
            description: 'Refactoring Task',
            status: 'My Tasks',
            date: cDate,
            hours: 1,
            category: '',
          ),
        ],
      );
    },
  );
}
