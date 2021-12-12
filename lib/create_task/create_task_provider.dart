import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_scheduler_example/models/task.dart';

class CreateTaskProvider extends StateNotifier<Task> {
  CreateTaskProvider(Task task)
      : super(
          Task(
            id: task.id,
            hours: task.hours,
            title: task.title,
            description: task.description,
            category: task.category,
            status: task.status,
            date: task.date,
          ),
        );

  void setTask(item, value) async {
    switch (item) {
      case 'title':
        state = state..title = value;
        break;

      case 'date':
        state = state..date = value;
        break;

      case 'description':
        state = state..description = value;
        break;

      case 'category':
        state = state..category = value;
        break;

      case 'hours':
        state = state..hours = value;
        break;

      default:
        state = state;
        break;
    }
  }
}
