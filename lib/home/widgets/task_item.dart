import 'package:flutter/material.dart';
import 'package:flutter_scheduler_example/models/task.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Center taskItem(Task item) {
  String date() {
    final dt = item.date.difference(DateTime.now()).inDays;
    switch (dt) {
      case 0:
        return 'Today';
      case 1:
        return 'Tomorrow';
      case -1:
        return 'Yesterday';
      default:
        return '${dt.toString()} Days ${dt < 0 ? 'Ago' : 'To Go'}';
    }
  }

  return Center(
      child: Padding(
          padding: EdgeInsets.only(bottom: 20.sp, left: 52.sp, right: 48.5.sp),
          child: ListTile(
            dense: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.sp)),
            tileColor: Colors.white,
            leading: const Icon(
              Icons.calendar_today_sharp,
              color: Color(0xff9C2CF3),
            ),
            title: Text(item.title,
                style:
                    TextStyle(fontSize: 22.42.sp, fontWeight: FontWeight.w600)),
            subtitle: Text(date(),
                style: TextStyle(
                  fontSize: 16.sp,
                )),
            trailing: const Icon(Icons.more_vert),
          )));
}
