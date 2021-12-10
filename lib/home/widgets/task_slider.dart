import 'package:flutter/material.dart';
import 'package:flutter_scheduler_example/models/task.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Padding taskSlider(Task item) {
  return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Container(
        width: 341.sp,
        height: 339.sp,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.sp)),
            gradient: const LinearGradient(
                transform: GradientRotation(177.23),
                stops: [-0.13, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff9C2CF3), Color(0xff3A49F9)])),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(27.sp),
              leading: const Icon(
                Icons.app_registration,
                color: Colors.white70,
              ),
              title: Text(
                item.title,
                style: TextStyle(
                    fontSize: 22.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Text(item.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 33.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 35.sp,
            ),
            Text(item.date.toLocal().toIso8601String().substring(0, 10),
                style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w300)),
          ],
        ),
      ));
}
