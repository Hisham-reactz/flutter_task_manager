import 'package:flutter/material.dart';
import 'package:flutter_scheduler_example/home/home_provider.dart';
import 'package:flutter_scheduler_example/models/task.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container taskChip(
  TaskListFilter item,
  TaskListFilter filterProvider,
  TaskFilterNotify filterNotifier,
  TaskList taskNotifier,
) {
  final status = item.index == 0
      ? 'My Tasks'
      : item.index == 1
          ? 'In Progress'
          : 'Complete';
  return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xffE2E2E2),
          offset: Offset(
            17.0.sp,
            26.0.sp,
          ),
          blurRadius: 25.0.sp,
          spreadRadius: 2.0,
        )
      ]),
      width: 156.sp,
      height: 70.sp,
      child: ChoiceChip(
        padding: EdgeInsets.all(23.sp),
        backgroundColor: const Color(0xffE5EAFC),
        disabledColor: const Color(0xffE5EAFC),
        selectedColor: Colors.white,
        label: Text(status),
        labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        selected: item == filterProvider,
        onSelected: (bool selected) {
          filterNotifier.setFilter(item);
          taskNotifier.toggleStatus(item);
        },
      ));
}
