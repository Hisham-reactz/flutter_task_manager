import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_scheduler_example/home/widgets/bottom_tab.dart';
import 'package:flutter_scheduler_example/home/widgets/task_chip.dart';
import 'package:flutter_scheduler_example/home/widgets/task_item.dart';
import 'package:flutter_scheduler_example/home/widgets/task_slider.dart';
import 'package:flutter_scheduler_example/models/task.dart';
import 'package:flutter_scheduler_example/root/root_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rootProvider = RootProvider();
    return Scaffold(
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: getBottomButtons('Home', context),
        )
      ],
      appBar: AppBar(
        leading: IconButton(
          onPressed: null,
          icon: Icon(
            Icons.menu,
            color: Colors.black,
            size: 41.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.account_circle_rounded,
              color: Colors.black,
              size: 41.sp,
            ),
          ),
        ],
        backgroundColor: const Color(0xffF2F5FF),
        foregroundColor: Colors.black,
        elevation: 0,
        title: null,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 47.sp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 50.sp),
              child: Text(
                'Hello User',
                style: TextStyle(fontSize: 47.sp, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50.sp, top: 5.sp),
              child: Text(
                'Have a nice day.',
                style: TextStyle(fontSize: 23.09.sp),
              ),
            ),
            Consumer(builder: (context, ref, child) {
              final filterProvider = ref.watch(
                rootProvider.taskFilterProvider,
              );
              final filterNotifier = ref.watch(
                rootProvider.taskFilterProvider.notifier,
              );
              final taskNotifier = ref.watch(
                rootProvider.taskListProvider.notifier,
              );

              return Padding(
                padding: EdgeInsets.only(left: 50.sp, top: 52.sp),
                child: Wrap(spacing: 16.sp, children: [
                  for (var item in TaskListFilter.values)
                    taskChip(
                      item,
                      filterProvider,
                      filterNotifier,
                      taskNotifier,
                    ),
                ]),
              );
            }),
            SizedBox(
              height: 32.sp,
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 50.sp, right: 50.sp),
              primary: true,
              scrollDirection: Axis.horizontal,
              child: Consumer(builder: (context, ref, child) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (var item in ref.watch(rootProvider.taskListProvider))
                        taskSlider(item),
                    ]);
              }),
            ),
            SizedBox(
              height: 87.sp,
            ),
            SizedBox(
              height: 85.sp,
              child: Padding(
                padding: EdgeInsets.only(left: 50.sp),
                child: Text(
                  'Progress',
                  style:
                      TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Consumer(builder: (context, ref, child) {
              return Column(
                children: [
                  for (var item in ref.watch(rootProvider.taskListProvider))
                    taskItem(item)
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
