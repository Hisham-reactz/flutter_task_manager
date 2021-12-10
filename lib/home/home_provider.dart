import 'package:flutter_scheduler_example/models/task.dart';
import 'package:riverpod/riverpod.dart';

class TaskFilterNotify extends StateNotifier<TaskListFilter> {
  TaskFilterNotify([TaskListFilter? initialTasks])
      : super(initialTasks ?? TaskListFilter.all);

  void setFilter(TaskListFilter item) {
    state = item;
  }
}

/// An object that controls a list of [Task].
class TaskList extends StateNotifier<List<Task>> {
  TaskList([List<Task>? initialTasks]) : super(initialTasks ?? []);

  List<Task> allTasks = [];
  int taskLEngth = 0;

  void initState() {
    if (state.length >= taskLEngth) {
      taskLEngth = state.length;
      allTasks = state;
    }
  }

  void addTask(Task task) {
    state = [
      ...state,
      Task(
        id: task.id,
        title: task.title,
        description: task.description,
        status: task.status,
        date: task.date,
        hours: task.hours,
        category: task.category,
      ),
    ];
  }

  void selectTask(int id) {
    state = [
      for (final task in state)
        if (task.id == id)
          Task(
            id: task.id,
            title: task.title,
            description: task.description,
            status: task.status,
            date: task.date,
            hours: task.hours,
            category: task.category,
          )
        else
          task,
    ];
  }

  void editTask({required int id, required String description}) {
    state = [
      for (final task in state)
        if (task.id == id)
          Task(
            id: task.id,
            title: task.title,
            description: task.description,
            status: task.status,
            date: task.date,
            hours: task.hours,
            category: task.category,
          )
        else
          task,
    ];
  }

  void filterTasks(DateTime date) async {
    initState();
    state = allTasks.where((tasks) => tasks.date == date).toList();
  }

  void toggleStatus(TaskListFilter item) async {
    initState();
    switch (item) {
      case TaskListFilter.completed:
        state = allTasks.where((tasks) => tasks.status == 'Complete').toList();
        break;
      case TaskListFilter.active:
        state =
            allTasks.where((tasks) => tasks.status == 'In Progress').toList();
        break;
      case TaskListFilter.all:
        state = allTasks;
        break;
    }
  }

  void removeTask(int id) {
    state = state.where((task) => task.id != id).toList();
  }
}
