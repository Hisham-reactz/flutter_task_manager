import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_scheduler_example/home/widgets/bottom_tab.dart';
import 'package:flutter_scheduler_example/home/widgets/task_item.dart';
import 'package:flutter_scheduler_example/root/root_provider.dart';
import 'package:flutter_scheduler_example/tasks/widgets/header_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskView extends StatelessWidget {
  const TaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rootProvider = RootProvider();
    return Scaffold(
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: getBottomButtons('Tasks', context),
        )
      ],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 41.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: 41.sp,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: null,
        bottom: PreferredSize(
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            275.sp,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20.sp),
              ),
            ),
            child: Consumer(builder: (context, ref, child) {
              return headerCalendar(
                context,
                ref,
                rootProvider.taskDateProvider,
                rootProvider.taskListProvider,
              );
            }),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer(builder: (context, ref, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(46.sp),
                child: Text(
                  'Tasks',
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              for (var item in ref.watch(rootProvider.taskListProvider))
                taskItem(item)
            ],
          );
        }),
      ),
    );
  }
}
