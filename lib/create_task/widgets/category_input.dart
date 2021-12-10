import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_scheduler_example/root/root_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox categoryInput(
  BuildContext context,
  WidgetRef ref,
) {
  final root = RootProvider();
  final taskProvider = ref.watch(
    root.taskProvider,
  );
  final taskProviderNotifier = ref.watch(
    root.taskProvider.notifier,
  );
  final cats = [
    'Design',
    'Meeting',
    'Coding',
    'BDE',
    'Testing',
    'QA',
  ];
  return SizedBox(
    width: 512.sp,
    child: ListTile(
      isThreeLine: true,
      title: SizedBox(
        height: 40.sp,
        child: Text(
          'Category',
          style: TextStyle(
            fontSize: 22.sp,
            color: const Color(0xffBFC8E8),
          ),
        ),
      ),
      subtitle: SizedBox(
        width: 512.sp,
        height: 350.sp,
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 25.sp,
          mainAxisSpacing: 25.sp,
          children: [
            for (final item in cats)
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.sp),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    item == taskProvider.category
                        ? const Color(0xff3A49F9)
                        : const Color(0xffE5EAFC),
                  ),
                ),
                onPressed: () {
                  taskProviderNotifier.setTask('category', item);
                },
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: item == taskProvider.category
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
    ),
  );
}
