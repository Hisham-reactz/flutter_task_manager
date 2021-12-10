enum TaskListFilter {
  all,
  active,
  completed,
}

class Task {
  Task({
    required this.id,
    required this.hours,
    required this.title,
    required this.description,
    required this.status,
    required this.category,
    required this.date,
  });

  int id;
  int hours;
  String title;
  String description;
  String status;
  String category;
  DateTime date;
}
