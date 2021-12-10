import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

Column headerCalendar(
  BuildContext context,
  WidgetRef ref,
  dateProvider,
  taskProvider,
) {
  final dateNotifier = ref.watch(
    dateProvider.notifier,
  );
  final taskNotifier = ref.watch(
    taskProvider.notifier,
  );

  return Column(children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          ref.watch(dateProvider).toString().substring(0, 10),
          style: TextStyle(
            fontSize: 46.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          width: 131.sp,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(50.sp),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff9C2CF3),
                Color(0xff3A49F9),
              ],
            ),
          ),
          child: ElevatedButton.icon(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(
                Colors.transparent,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/create_task');
            },
            icon: Icon(
              Icons.add,
              size: 16.sp,
              color: Colors.white,
            ),
            label: Text(
              'Add Task',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    ),
    SizedBox(height: 62.sp),
    TableCalendar(
      calendarFormat: CalendarFormat.week,
      onDaySelected: (cdate, pdate) {
        final datez = DateTime(
          cdate.year,
          cdate.month,
          cdate.day,
        );
        dateNotifier.changeDate(datez);
        taskNotifier.filterTasks(datez);
      },
      headerVisible: false,
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      currentDay: ref.watch(dateProvider),
      calendarStyle: const CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: Colors.red,
        ),
      ),
      focusedDay: ref.watch(dateProvider),
    ),
  ]);
}
