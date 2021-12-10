import 'package:flutter/material.dart';
import 'package:flutter_scheduler_example/create_task/widgets/header_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSize createTaskAppbar(
  BuildContext context,
) {
  return PreferredSize(
    preferredSize: Size(0, 425.sp),
    child: DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.sp),
          bottomRight: Radius.circular(20.sp),
        ),
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff9C2CF3),
              Color(0xff3A49F9),
            ]),
      ),
      child: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 41.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 41.sp,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('Create a task'),
        bottom: PreferredSize(
          preferredSize: Size(0, 311.sp),
          child: headerForm(
            context,
          ),
        ),
      ),
    ),
  );
}
