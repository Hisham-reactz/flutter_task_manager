import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskDateProvider extends StateNotifier<DateTime> {
  TaskDateProvider(DateTime dateTime)
      : super(DateTime(
          dateTime.year,
          dateTime.month,
          dateTime.day,
        ));

  void changeDate(DateTime date) {
    state = date;
    // print(state);
  }
}
